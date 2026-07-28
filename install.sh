#!/usr/bin/env bash
set -euo pipefail

DEST_DIR="/var/lib/pasarguard/templates/subscription"
DEST_FILE="${DEST_DIR}/index.html"
ENV_FILE="/opt/pasarguard/.env"
REPO_URL="https://github.com/AH-Foud/pasarguard-sub-custom.git"
TMP_DIR=$(mktemp -d)

cleanup() { rm -rf "$TMP_DIR"; }
trap cleanup EXIT

echo "Cloning repository..."
git clone "$REPO_URL" "$TMP_DIR"

cd "$TMP_DIR"

if ! command -v bun >/dev/null 2>&1; then
  echo "Installing bun..."
  curl -fsSL https://bun.sh/install | bash
  export PATH="$HOME/.bun/bin:$PATH"
fi

echo "Installing dependencies..."
bun install

echo "Building..."
bun run build

mkdir -p "$DEST_DIR"
cp dist/index.html "$DEST_FILE"

mkdir -p "$(dirname "$ENV_FILE")"
touch "$ENV_FILE"

if grep -q '^CUSTOM_TEMPLATES_DIRECTORY=' "$ENV_FILE"; then
  sed -i 's|^CUSTOM_TEMPLATES_DIRECTORY=.*|CUSTOM_TEMPLATES_DIRECTORY="/var/lib/pasarguard/templates/"|' "$ENV_FILE"
else
  echo 'CUSTOM_TEMPLATES_DIRECTORY="/var/lib/pasarguard/templates/"' >> "$ENV_FILE"
fi

if grep -q '^SUBSCRIPTION_PAGE_TEMPLATE=' "$ENV_FILE"; then
  sed -i 's|^SUBSCRIPTION_PAGE_TEMPLATE=.*|SUBSCRIPTION_PAGE_TEMPLATE="subscription/index.html"|' "$ENV_FILE"
else
  echo 'SUBSCRIPTION_PAGE_TEMPLATE="subscription/index.html"' >> "$ENV_FILE"
fi

if command -v pasarguard >/dev/null 2>&1; then
  pasarguard restart
  echo "Done! Template installed and PasarGuard restarted."
else
  echo "Done! Template installed at $DEST_FILE"
  echo "Restart your panel manually."
fi
