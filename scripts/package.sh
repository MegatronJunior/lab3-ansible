#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."
mkdir -p artifacts
tar -czf artifacts/app.tar.gz --exclude=__pycache__ --exclude='*.pyc' -C . app
