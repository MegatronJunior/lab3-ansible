#!/usr/bin/env bash
set -euo pipefail

install -d -m 0700 /root/.ssh
install -d -m 0755 /run/sshd
install -m 0600 /run/ansible-key/id_ed25519.pub /root/.ssh/authorized_keys
ssh-keygen -A
exec /usr/sbin/sshd -D -e
