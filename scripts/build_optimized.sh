#!/usr/bin/env bash
# Optimized Flutter Web build for GitHub Pages (macOS / Linux)
# Mirrors .github/workflows/deploy.yml (base-href + service worker copy).
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$ROOT"

echo ">> flutter pub get"
flutter pub get

echo ">> flutter clean"
flutter clean

echo ">> flutter build web --release"
EXTRA=()
if [[ -n "${FORMSPREE_ENDPOINT:-}" ]]; then
  EXTRA+=(--dart-define="FORMSPREE_ENDPOINT=$FORMSPREE_ENDPOINT")
fi
if [[ -n "${CONTACT_RECIPIENT_EMAIL:-}" ]]; then
  EXTRA+=(--dart-define="CONTACT_RECIPIENT_EMAIL=$CONTACT_RECIPIENT_EMAIL")
fi
flutter build web \
  --release \
  --base-href "/Youssef-Hassan-Portfolio/" \
  --no-source-maps \
  "${EXTRA[@]}"

WEB_OUT="$ROOT/build/web"
if [[ ! -d "$WEB_OUT" ]]; then
  echo "ERROR: build/web not found after build." >&2
  exit 1
fi

echo ">> Copy service worker / headers"
cp -f "$ROOT/web/service-worker.js" "$WEB_OUT/"
[[ -f "$ROOT/web/.htaccess" ]] && cp -f "$ROOT/web/.htaccess" "$WEB_OUT/" || true
[[ -f "$ROOT/web/_headers" ]] && cp -f "$ROOT/web/_headers" "$WEB_OUT/" || true

touch "$WEB_OUT/.nojekyll"

echo ">> Done. Output: $WEB_OUT"
