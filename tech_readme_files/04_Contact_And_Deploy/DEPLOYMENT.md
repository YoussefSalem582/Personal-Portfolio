# Deployment (GitHub Pages)

## CI

Workflow: [.github/workflows/deploy.yml](../../.github/workflows/deploy.yml).

What it does (summary):

- **Trigger:** push to `master` or manual `workflow_dispatch`
- **Flutter:** stable `3.24.0`
- **Build:** `flutter build web --release --base-href "/Youssef-Hassan-Portfolio/" --no-source-maps`, plus optional `--dart-define` flags (see below)
- **Extras:** copies `web/service-worker.js`, `web/.htaccess`, `web/_headers` into `build/web` when present; copies `build/web/index.html` to `build/web/404.html` (GitHub Pages SPA fallback); creates `build/web/.nojekyll`
- **Publish:** uploads **`build/web`** as the GitHub Pages artifact (`actions/deploy-pages`)

### Contact form / optional repository secrets

The workflow can inject Formspree and display email at compile time (see [contact_runtime_config.dart](../../lib/core/config/contact_runtime_config.dart)):

| Repository secret | Effect |
|-------------------|--------|
| `FORMSPREE_ENDPOINT` | Adds `--dart-define=FORMSPREE_ENDPOINT=…` when non-empty |
| `CONTACT_RECIPIENT_EMAIL` | Adds `--dart-define=CONTACT_RECIPIENT_EMAIL=…` when non-empty |

If both are **unset** or empty, the build uses fallbacks in [`lib/core/config/api_keys.dart`](../../lib/core/config/api_keys.dart).

**Setup:** GitHub → **Settings → Secrets and variables → Actions → New repository secret**.

Full contact wiring: [CONTACT_FORM.md](CONTACT_FORM.md).

## Base href

GitHub Pages often serves the app from a **repository subpath** (this repo uses `/Youssef-Hassan-Portfolio/`). Local builds must use the same `--base-href` as CI.

## Local optimized build

**Windows:** from repo root run `.\scripts\build_optimized.ps1`.

**macOS / Linux:** `chmod +x ./scripts/build_optimized.sh && ./scripts/build_optimized.sh` (same steps as CI).

This mirrors the CI build flags and copies service worker / static server files into `build/web`, including `404.html` for GitHub Pages deep links.

**Optional:** before running the script, export `FORMSPREE_ENDPOINT` and/or `CONTACT_RECIPIENT_EMAIL` so they are passed as `--dart-define` (same as Actions). See [`.env.example`](../../.env.example) for a commented template (Flutter does not load `.env` automatically—use your shell or IDE run configuration).

Alternatively run the same `flutter build web` command as in the workflow, then copy `web/service-worker.js` (and optional `_headers` / `.htaccess`) into `build/web`, copy `build/web/index.html` to `build/web/404.html`, and add `.nojekyll`.

## Output folder

CI deploys **`build/web`**, not `docs/`.

## Assets and GitHub raw URLs

Some documents open from GitHub (raw / Pages). If you fork or rename the repo, update [lib/core/config/app_config.dart](../../lib/core/config/app_config.dart) and related URL helpers per [lib/core/utils/url_helper.dart](../../lib/core/utils/url_helper.dart).

## SEO (canonical URL, indexing, SPA)

Flutter Web shells start from [`web/index.html`](../../web/index.html). Discoverability-related static assets under [`web/`](../../web/) are copied into `build/web` by `flutter build web`:

| File | Purpose |
|------|---------|
| [`web/robots.txt`](../../web/robots.txt) | **`Sitemap:`** absolute URL — keep in sync with the live GitHub Pages base URL (subpath deployments include the repo name). |
| [`web/sitemap.xml`](../../web/sitemap.xml) | Path-based section and project case study URLs (no `#` fragments). Update **`lastmod`** when you materially change indexed pages or add/remove project URLs. |
| [`web/index.html`](../../web/index.html) | `<html lang>`, `link rel="canonical"`, **`link rel="sitemap"`**, Open Graph/Twitter, `og:locale` / `og:locale:alternate`, `robots` preview hints, **`application/ld+json`** (`Person` + `WebSite`: email, country, `sameAs`, `knowsAbout`), `og:image` dimensions. |
| [`web/manifest.json`](../../web/manifest.json) | Shortcuts must use **path** URLs (same as the router), not `#/…`. Keep `description` / `theme_color` aligned with [`web/index.html`](../../web/index.html) when you change positioning. |
| [`web/llms.txt`](../../web/llms.txt) | Short summary and profile links for tools that consume `llms.txt`. |

**Single origin:** Canonical links, OG `og:url`/images, and sitemap **`loc`** entries assume **`https://youssefsalem582.github.io/Youssef-Hassan-Portfolio/`**. If you add a **custom domain** or rename the repo, update those files plus [`web/manifest.json`](../../web/manifest.json) together.

**Search Console:** After deploy, submit **`…/sitemap.xml`** in Google Search Console.

**Og image dimensions:** Match `assets/images/portfolio_logo.jpg`; change [`web/index.html`](../../web/index.html) `og:image:width` / `og:image:height` if you replace that image.

When you add or rename project gallery assets, update [`web/sitemap.xml`](../../web/sitemap.xml) if URLs change. Prefer meaningful **image labels** in UI: [`LazyImage`](../../lib/core/widgets/lazy_image.dart) supports `semanticLabel` (accessibility and clearer web semantics).
