#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."
docker compose ps
docker compose exec -T controller ansible -i inventory.ini all -m ping
curl -fsS http://127.0.0.1:8080/
printf '\n'
curl -fsS http://127.0.0.1:8080/health
printf '\n'
