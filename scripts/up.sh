#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."
mkdir -p .ssh artifacts
chmod 700 .ssh

if [[ ! -f .ssh/id_ed25519 && ! -f .ssh/id_ed25519.pub ]]; then
    ssh-keygen -t ed25519 -N "" -f .ssh/id_ed25519 -q
fi

if [[ ! -f .ssh/id_ed25519 || ! -f .ssh/id_ed25519.pub ]]; then
    echo "Incomplete SSH key pair in .ssh/" >&2
    exit 1
fi

chmod 600 .ssh/id_ed25519
docker compose up -d --build
