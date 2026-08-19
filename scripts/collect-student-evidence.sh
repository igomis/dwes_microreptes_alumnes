#!/usr/bin/env sh
set -eu

OUTPUT="${1:-_artifacts/evidence-summary.json}"
mkdir -p "$(dirname "$OUTPUT")"

node - "$OUTPUT" <<'NODE'
const fs = require('fs');
const path = require('path');

const output = process.argv[2];
const textExtensions = new Set([
  '.md',
  '.txt',
  '.json',
  '.yml',
  '.yaml',
  '.php',
  '.js',
  '.ts',
  '.html',
  '.css',
  '.py',
  '.sh'
]);
const maxFilesPerSection = 12;
const maxExcerptChars = 4000;
const templateGuideFiles = new Set([
  'docs/README.md',
  'docs/autograde.md',
  'docs/actualitzar-repos-classroom.md',
  'evidence/README.md',
  'tests/README.md'
]);

function listFiles(dir, maxFiles = maxFilesPerSection) {
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
      } else if (entry.isFile() && !templateGuideFiles.has(fullPath)) {
        result.push(fullPath);
      }
    }
  }

  walk(dir);
  return result;
}

function isTextFile(filePath) {
  return textExtensions.has(path.extname(filePath).toLowerCase());
}

function safeExcerpt(filePath) {
  if (!fs.existsSync(filePath) || !fs.statSync(filePath).isFile()) {
    return null;
  }

  if (!isTextFile(filePath)) {
    return null;
  }

  const content = fs.readFileSync(filePath, 'utf8');
  return content.length > maxExcerptChars
    ? `${content.slice(0, maxExcerptChars)}\n...[retallat]`
    : content;
}

function fileSummary(filePath) {
  if (!fs.existsSync(filePath) || !fs.statSync(filePath).isFile()) {
    return null;
  }

  const content = isTextFile(filePath) ? fs.readFileSync(filePath, 'utf8') : '';
  return {
    path: filePath,
    bytes: fs.statSync(filePath).size,
    lines: content.length === 0 ? 0 : content.split('\n').length,
    excerpt: safeExcerpt(filePath)
  };
}

function summarizeFiles(files) {
  return files.map((filePath) => fileSummary(filePath)).filter(Boolean);
}

const summary = {
  generated_at: new Date().toISOString(),
  delivery: fileSummary('ENTREGA.md'),
  readme: fileSummary('README.md'),
  ai_log: fileSummary('docs/ai-log.md'),
  docs_files: summarizeFiles(listFiles('docs')),
  evidence_files: summarizeFiles(listFiles('evidence')),
  test_files: summarizeFiles(listFiles('tests')),
  source_files: summarizeFiles(listFiles('src'))
};

fs.writeFileSync(output, JSON.stringify(summary, null, 2));
NODE

echo "Resum d'evidències guardat en ${OUTPUT}"
