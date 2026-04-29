# Deployment (Vercel)

## Overview

Production builds are **static Flutter Web** output deployed to **[Vercel](https://vercel.com/)**. Routing is client-side (`go_router`); [`vercel.json`](../../vercel.json) at the repo root defines SPA **rewrites** so deep links (e.g. `/project/foo`) resolve without a GitHub Pages–style `404.html` fallback.

CI copies [`vercel.json`](../../vercel.json) into `build/web/` before `vercel deploy` so the deployed bundle includes routing rules next to `index.html`.

## CI

Workflow: [.github/workflows/deploy.yml](../../.github/workflows/deploy.yml).

What it does (summary):

- **Trigger:** push to `master` or manual `workflow_dispatch`
- **Flutter:** stable `3.24.0`
- **Build:** `flutter build web --release --base-href "/" --no-source-maps`, plus optional `--dart-define` flags (see below)
- **Extras:** copies `web/service-worker.js`, `web/.htaccess`, `web/_headers` into `build/web` when present; copies [`vercel.json`](../../vercel.json) into `build/web`
- **Publish:** `vercel deploy --prod` from **`build/web`** using repository secrets (non-interactive)

### Repository secrets

| Secret | Purpose |
|--------|---------|
| `VERCEL_TOKEN` | Vercel CLI authentication ([account tokens](https://vercel.com/account/tokens)) |
| `VERCEL_ORG_ID` | Team / user ID (Project → Settings → General) |
| `VERCEL_PROJECT_ID` | Project ID (same screen) |

Optional:

| Secret | Effect |
|--------|--------|
| `SITE_BASE_URL` | Overrides default canonical URL passed as `--dart-define=SITE_BASE_URL=…` (match your production hostname, including **custom domain**) |
| `FORMSPREE_ENDPOINT` | Adds `--dart-define=FORMSPREE_ENDPOINT=…` when non-empty |
| `CONTACT_RECIPIENT_EMAIL` | Adds `--dart-define=CONTACT_RECIPIENT_EMAIL=…` when non-empty |

If Formspree secrets are **unset**, the build uses fallbacks in [`lib/core/config/api_keys.dart`](../../lib/core/config/api_keys.dart).

Default `SITE_BASE_URL` in CI when the secret is unset: **`https://youssef-salem-portfolio.vercel.app`**. Override when you use a **custom domain** so [`AppConfig.siteBaseUrl`](../../lib/core/config/app_config.dart) matches production.

**Setup:** GitHub → **Settings → Secrets and variables → Actions → New repository secret**.

Full contact wiring: [CONTACT_FORM.md](CONTACT_FORM.md).

## Vercel project

1. Create or link a project to this GitHub repo (same repo CI builds from).
2. Add your **custom domain** in Vercel if desired; configure DNS per Vercel.
3. Pick **one canonical origin** (apex vs `www`) and redirect the other in Vercel; align **`SITE_BASE_URL`**, [`web/index.html`](../../web/index.html), [`web/sitemap.xml`](../../web/sitemap.xml), and [`web/robots.txt`](../../web/robots.txt).

You can disable **GitHub Pages** in the repository settings if it was previously enabled.

## Base href

Production uses **`--base-href "/"`** (site served at the domain root). Local optimized builds must use the same flags as CI.

## Local optimized build

**Windows:** from repo root run `.\scripts\build_optimized.ps1`.

**macOS / Linux:** `chmod +x ./scripts/build_optimized.sh && ./scripts/build_optimized.sh`.

Optional environment variables before running (same semantics as Actions):

- `FORMSPREE_ENDPOINT`, `CONTACT_RECIPIENT_EMAIL`
- `SITE_BASE_URL` — passed as `--dart-define=SITE_BASE_URL=…`

Alternatively run the same `flutter build web` command as in the workflow, then copy `web/service-worker.js`, optional `_headers` / `.htaccess`, and **`vercel.json`** into `build/web`.

See [`.env.example`](../../.env.example) for a commented template (Flutter does not load `.env` automatically).

## Output folder

CI deploys **`build/web`**, not `docs/`.

## Assets and GitHub raw URLs

PDF/HTML assets may still open via **GitHub raw** URLs for viewers; repo identity lives in [`lib/core/config/app_config.dart`](../../lib/core/config/app_config.dart). Deployed-origin URLs for other assets use [`AppConfig.siteBaseUrl`](../../lib/core/config/app_config.dart) — see [`lib/core/utils/url_helper.dart`](../../lib/core/utils/url_helper.dart).

## Migrating from the old GitHub Pages URL

If visitors still bookmark **`https://youssefsalem582.github.io/Youssef-Salem-Portfolio/`**, consider:

- Leaving a short-lived redirect from the old Pages deployment (meta refresh or GitHub Pages redirect) to your Vercel / custom-domain URL, or
- Disabling Pages once DNS and Search Console point at the new origin.

Update Search Console property and **`sitemap.xml`** submissions when the canonical domain changes.

## SEO (canonical URL, indexing, SPA)

Flutter Web shells start from [`web/index.html`](../../web/index.html). Discoverability-related static assets under [`web/`](../../web/) are copied into `build/web` by `flutter build web`:

| File | Purpose |
|------|---------|
| [`web/robots.txt`](../../web/robots.txt) | **`Sitemap:`** absolute URL — keep in sync with the live origin. |
| [`web/sitemap.xml`](../../web/sitemap.xml) | Path-based section and project case study URLs (no `#` fragments). Update **`lastmod`** when you materially change indexed pages or add/remove project URLs. |
| [`web/index.html`](../../web/index.html) | `<html lang>`, `link rel="canonical"`, **`link rel="sitemap"`**, Open Graph/Twitter, `og:locale` / `og:locale:alternate`, `robots` preview hints, **`application/ld+json`** (`Person` + `WebSite`). |
| [`web/manifest.json`](../../web/manifest.json) | Shortcuts must use **path** URLs (same as the router), not `#/…`. |
| [`web/llms.txt`](../../web/llms.txt) | Short summary for tools that consume `llms.txt`. |

**Single origin:** Canonical links, OG `og:url`/images, and sitemap **`loc`** entries should match your production hostname (default deployment URL or **custom domain**). Update [`web/manifest.json`](../../web/manifest.json) together with HTML/sitemap when the origin changes.

**Search Console:** After deploy, submit **`…/sitemap.xml`** for your canonical host.

**Og image dimensions:** Match `assets/images/portfolio_logo.jpg`; change [`web/index.html`](../../web/index.html) `og:image:width` / `og:image:height` if you replace that image.

When you add or rename project gallery assets, update [`web/sitemap.xml`](../../web/sitemap.xml) if URLs change. Prefer meaningful **image labels** in UI: [`LazyImage`](../../lib/core/widgets/lazy_image.dart) supports `semanticLabel`.
