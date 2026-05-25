#!/usr/bin/env sh
set -eu

OUTPUT="${1:-_artifacts/evidence-summary.json}"
mkdir -p "$(dirname "$OUTPUT")"

node - "$OUTPUT" <<'NODE'
const fs = require('fs');
const path = require('path');

const output = process.argv[2];

function listFiles(dir, maxFiles = 50) {
  if (!fs.existsSync(dir) || !fs.statSync(dir).isDirectory()) {
    return [];
  }

  const result = [];

  function walk(current) {
    if (result.length >= maxFiles) {
      return;
    }

    for (const entry of fs.readdirSync(current, { withFileTypes: true })) {
      if (result.length >= maxFiles) {
        return;
      }

      const fullPath = path.join(current, entry.name);
      if (entry.isDirectory()) {
        walk(fullPath);
      } else if (entry.isFile()) {
        result.push(fullPath);
      }
    }
  }

  walk(dir);
  return result;
}

function fileSummary(filePath) {
  if (!fs.existsSync(filePath) || !fs.statSync(filePath).isFile()) {
    return null;
  }

  const content = fs.readFileSync(filePath, 'utf8');
  return {
    path: filePath,
    bytes: Buffer.byteLength(content),
    lines: content.length === 0 ? 0 : content.split('\n').length
  };
}

const summary = {
  generated_at: new Date().toISOString(),
  readme: fileSummary('README.md'),
  ai_log: fileSummary('docs/ai-log.md'),
  evidence_files: listFiles('evidence'),
  test_files: listFiles('tests'),
  source_files: listFiles('src')
};

fs.writeFileSync(output, JSON.stringify(summary, null, 2));
NODE

echo "Resum d'evidències guardat en ${OUTPUT}"
