#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"
required=(
  AGENTS.md
  CONTRIBUTING.md
  docs/testing.md
  scripts/validate.sh
  .github/ISSUE_TEMPLATE/agent-task.yml
  agent/sensitive-paths.yml
  LICENSE
  Makefile
)
missing=0
for f in "${required[@]}"; do
  if [[ ! -e "$f" ]]; then
    echo "missing: $f" >&2
    missing=1
  fi
done
if [[ "$missing" -ne 0 ]]; then
  exit 1
fi
# basic YAML / shell hygiene without external tools
bash -n scripts/validate.sh
echo "validate: ok"
