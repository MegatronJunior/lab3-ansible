#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."
bash scripts/package.sh
docker compose exec -T controller ansible-playbook -i inventory.ini site.yml
