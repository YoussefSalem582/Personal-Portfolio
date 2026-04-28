# Deployment (GitHub Pages)

## CI

Workflow: [.github/workflows/deploy.yml](../../.github/workflows/deploy.yml).

What it does (summary):

- **Trigger:** push to `master` or manual `workflow_dispatch`
- **Flutter:** stable `3.24.0`
- **Build:** `flutter build web --release --base-href "/Youssef-Hassan-Portfolio/" --no-source-maps`, plus optional `--dart-define` flags (see below)
- **Extras:** copies `web/service-worker.js`, `web/.htaccess`, `web/_headers` into `build/web` when present; creates `build/web/.nojekyll`
- **Publish:** uploads **`build/web`** as the GitHub Pages artifact (`actions/deploy-pages`)

### Contact form / optional repository secrets

The workflow can inject Formspree and display email at compile time (see [contact_runtime_config.dart](../../lib/config/contact_runtime_config.dart)):

| Repository secret | Effect |
|-------------------|--------|
| `FORMSPREE_ENDPOINT` | Adds `--dart-define=FORMSPREE_ENDPOINT=…` when non-empty |
| `CONTACT_RECIPIENT_EMAIL` | Adds `--dart-define=CONTACT_RECIPIENT_EMAIL=…` when non-empty |

If both are **unset** or empty, the build uses fallbacks in [`lib/config/api_keys.dart`](../../lib/config/api_keys.dart).

**Setup:** GitHub → **Settings → Secrets and variables → Actions → New repository secret**.

Full contact wiring: [CONTACT_FORM.md](CONTACT_FORM.md).

## Base href

GitHub Pages often serves the app from a **repository subpath** (this repo uses `/Youssef-Hassan-Portfolio/`). Local builds must use the same `--base-href` as CI.

## Local optimized build

**Windows:** from repo root run `.\scripts\build_optimized.ps1`.

**macOS / Linux:** `chmod +x ./scripts/build_optimized.sh && ./scripts/build_optimized.sh` (same steps as CI).

This mirrors the CI build flags and copies service worker / static server files into `build/web`.

**Optional:** before running the script, export `FORMSPREE_ENDPOINT` and/or `CONTACT_RECIPIENT_EMAIL` so they are passed as `--dart-define` (same as Actions). See [`.env.example`](../../.env.example) for a commented template (Flutter does not load `.env` automatically—use your shell or IDE run configuration).

Alternatively run the same `flutter build web` command as in the workflow, then copy `web/service-worker.js` (and optional `_headers` / `.htaccess`) into `build/web`, and add `.nojekyll`.

## Output folder

CI deploys **`build/web`**, not `docs/`.

## Assets and GitHub raw URLs

Some documents open from GitHub (raw / Pages). If you fork or rename the repo, update [lib/config/app_config.dart](../../lib/config/app_config.dart) and related URL helpers per [lib/utils/url_helper.dart](../../lib/utils/url_helper.dart).
