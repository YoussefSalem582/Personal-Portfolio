# Deployment (GitHub Pages)

## CI

Workflow: [.github/workflows/deploy.yml](../../.github/workflows/deploy.yml).

What it does (summary):

- **Trigger:** push to `master` or manual `workflow_dispatch`
- **Flutter:** stable `3.24.0`
- **Build:** `flutter build web --release --base-href "/Youssef-Hassan-Portfolio/" --no-source-maps`
- **Extras:** copies `web/service-worker.js`, `web/.htaccess`, `web/_headers` into `build/web` when present; creates `build/web/.nojekyll`
- **Publish:** uploads **`build/web`** as the GitHub Pages artifact (`actions/deploy-pages`)

## Base href

GitHub Pages often serves the app from a **repository subpath** (this repo uses `/Youssef-Hassan-Portfolio/`). Local builds must use the same `--base-href` as CI.

## Local optimized build

**Windows:** from repo root run `.\build_optimized.ps1`.

**macOS / Linux:** `chmod +x ./build_optimized.sh && ./build_optimized.sh` (same steps as CI).

This mirrors the CI build flags and copies service worker / static server files into `build/web`.

Alternatively run the same `flutter build web` command as in the workflow, then copy `web/service-worker.js` (and optional `_headers` / `.htaccess`) into `build/web`, and add `.nojekyll`.

## Output folder

CI deploys **`build/web`**, not `docs/`.

## Assets and GitHub raw URLs

Some documents open from GitHub (raw / Pages). If you fork or rename the repo, update [lib/config/app_config.dart](../../lib/config/app_config.dart) and related URL helpers per [lib/utils/url_helper.dart](../../lib/utils/url_helper.dart).
