#!/usr/bin/env sh
set -eu

OUTPUT="${1:-_artifacts/repo-signals.json}"
mkdir -p "$(dirname "$OUTPUT")"

CURRENT_COMMIT="$(git rev-parse HEAD 2>/dev/null || true)"
TRACKED_FILES_COUNT="$(git ls-files 2>/dev/null | wc -l | tr -d ' ')"
export CURRENT_COMMIT
export TRACKED_FILES_COUNT

node - "$OUTPUT" <<'NODE'
const fs = require('fs');
const path = require('path');

const output = process.argv[2];

function exists(filePath) {
  return fs.existsSync(filePath);
}

function isDirectory(filePath) {
  return exists(filePath) && fs.statSync(filePath).isDirectory();
}

function countFiles(dir) {
  if (!isDirectory(dir)) {
    return 0;
  }

  let total = 0;
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    if (entry.name === '.git') {
      continue;
    }

    const fullPath = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      total += countFiles(fullPath);
    } else if (entry.isFile()) {
      total += 1;
    }
  }

  return total;
}

const signals = {
  generated_at: new Date().toISOString(),
  repository: process.env.STUDENT_REPO || '',
  commit: process.env.STUDENT_COMMIT || process.env.CURRENT_COMMIT || '',
  files: {
    readme: exists('README.md'),
    delivery: exists('ENTREGA.md'),
    ai_log: exists('docs/ai-log.md'),
    student_meta: exists('student-meta.json')
  },
  folders: {
    src: isDirectory('src'),
    tests: isDirectory('tests'),
    evidence: isDirectory('evidence'),
    docs: isDirectory('docs')
  },
  counts: {
    tracked_files: Number(process.env.TRACKED_FILES_COUNT || 0),
    src_files: countFiles('src'),
    test_files: countFiles('tests'),
    evidence_files: countFiles('evidence'),
    docs_files: countFiles('docs')
  }
};

fs.writeFileSync(output, JSON.stringify(signals, null, 2));
NODE

echo "Senyals del repositori guardats en ${OUTPUT}"
