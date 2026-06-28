#!/usr/bin/env bash
# One-time setup: SSH commit signing for Git (no GPG).
set -euo pipefail

EMAIL="${GIT_AUTHOR_EMAIL:-$(git config --global user.email)}"
PUB_KEY="${HOME}/.ssh/id_rsa.pub"
ALLOWED="${HOME}/.config/git/allowed_signers"

if [[ ! -f "$PUB_KEY" ]]; then
  echo "Missing ${PUB_KEY}. Generate or point user.signingkey at your public key."
  exit 1
fi

mkdir -p "$(dirname "$ALLOWED")"
printf '%s namespaces="git" %s\n' "$EMAIL" "$(cat "$PUB_KEY")" > "$ALLOWED"
chmod 644 "$ALLOWED"

git config --global gpg.format ssh
git config --global user.signingkey "$PUB_KEY"
git config --global gpg.ssh.allowedSignersFile "$ALLOWED"
git config --global gpg.ssh.program "$(command -v ssh-keygen)"
git config --global commit.gpgsign true

ssh-add --apple-use-keychain "${HOME}/.ssh/id_rsa" 2>/dev/null || ssh-add "${HOME}/.ssh/id_rsa"

echo "Git SSH signing configured."
echo "Next: add the SAME public key at GitHub → Settings → SSH and GPG keys → New signing key"
echo "      https://github.com/settings/keys"
