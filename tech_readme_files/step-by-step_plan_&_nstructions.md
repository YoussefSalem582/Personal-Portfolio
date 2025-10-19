# Step-by-step plan & instructions for the AI agent (detailed)

Use this as the agent’s internal checklist — follow it exactly, one step at a time.

### Step 0 — Prepare & extract content

1. Load the supplied CV file and parse these fields:

   * Full name: **Youssef Salem Hassan** (use as site title).&#x20;
   * Contact: phone, email ([youssef.salem.hassan582@gmail.com](mailto:youssef.salem.hassan582@gmail.com)), LinkedIn, GitHub.&#x20;
   * Projects list and project repo/links (Music Player, Chat App, Online Exam/QuizHub, ChargeHub, Marketplace, Random Quote, Facial-Recognition-System, Sign Language Translator, Multi-Emotion Recognition, Comparative Analysis paper).&#x20;
   * Skills & tools: Dart/Flutter, Python, TensorFlow, PyTorch, Firebase, Git, ML tools.&#x20;

2. For each project entry:

   * Attempt to fetch GitHub repo and extract README, tech stack, screenshots. If repo not found or public assets missing, mark project as “needs images” and generate a short default screenshot instruction.

### Step 1 — Design & wireframes (quick)

1. Create three wireframes: Desktop, Tablet, Mobile

   * Header (logo/name, top nav)
   * Hero (left text, right screenshot/animation)
   * Projects grid (cards)
   * About & Skills (two-column)
   * Contact (form + social links)
   * Footer (license / resume download)
2. Choose a color palette (neutral background, one primary accent, one secondary accent), fonts (system + Google font fallback), spacing scale.

### Step 2 — Scaffold Flutter Web repo

1. `flutter create --web` (or use `flutter create portfolio_web --template=app`) using null-safety.
2. Add recommended packages (keep minimal):

   * `go_router` (routing)
   * `flutter_riverpod` (lightweight state)
   * `url_launcher` (open external links)
   * `cached_network_image` or lazy image loader (for web: careful with packages; provide fallback)
   * `flutter_test` (dev dependency)
   * (optional) `animated_page_reveal` or simple `AnimatedContainer` (no external dependency required)
3. Create directories:

   * `/lib/src/ui/` (widgets)
   * `/lib/src/pages/`
   * `/lib/src/models/`
   * `/assets/images/` (placeholder images)
   * `/web/index.html` (update meta tags)

### Step 3 — Implement core pages & components

1. **Main App**

   * `MaterialApp` or `MaterialApp.router` with `go_router`.
   * Global theme with light/dark toggle (persist choice to localStorage).
2. **Header**: name, nav links, resume download button.
3. **Hero**: headline + 2-line subheading + CTA “See projects / Contact” + hero image or animated device mockup.

   * Example headline options (choose 1):

     * “Youssef Salem Hassan — Flutter developer building fast cross-platform apps”
     * “Flutter Web & Mobile developer — Apps, ML integrations, and delightful UX”
4. **Projects grid**:

   * `ProjectCard` widget with: screenshot, title, one-line summary, tags, GitHub & demo buttons.
   * Clicking card opens detail page / modal with deeper description and screenshots.
5. **About / Resume**:

   * Short bio (1–3 lines), education, key experiences (list internships & roles). Add a “Download resume (PDF)” button pointing to `assets/resume.pdf`.
6. **Skills**:

   * Tag cloud or grouped chips (Flutter, Firebase, TensorFlow, BLoC/Riverpod, Git).
7. **Contact**:

   * Basic contact form that posts to a serverless endpoint (Netlify function / Vercel serverless / simple mailto fallback).
   * Social icons (GitHub, LinkedIn, Mostaql profile, Portfolio).
8. **Footer**:

   * Copyright, quick links, link to PDF resume.

### Step 4 — Accessibility & SEO

1. Add `Semantics` widgets for key components and ARIA-like labels.
2. In `web/index.html`:

   * Add descriptive `<title>`, `<meta name="description">`, `<meta name="keywords">`.
   * Add Open Graph and Twitter card tags (og\:title, og\:description, og\:image).
3. Ensure images have alt text (generate alt text from project titles).
4. Keyboard navigation: ensure all interactive controls are focusable.

### Step 5 — Performance & bundle optimization

1. Compress images; prefer WebP; lazy-load non-critical images.
2. Use minimal packages; tree-shake unused code.
3. Avoid heavy renderers on initial paint; defer animations.

### Step 6 — Testing

1. Unit tests for helper functions.
2. Widget tests for `Hero`, `ProjectCard`, `ContactForm`.
3. Run `flutter test` — ensure tests pass.

### Step 7 — CI / CD

1. Create GitHub Actions workflow:

   * checkout
   * setup Flutter (use latest stable)
   * `flutter pub get`
   * `flutter test`
   * `flutter build web`
   * deploy to chosen host (use Vercel/Netlify action or push build to `gh-pages`)
2. Add environment variables in CI for any API keys (contact form).

(Sample minimal workflow provided later in this message.)

### Step 8 — Deploy

1. Provide one-click instructions:

   * **Vercel**: connect repo → set Build command `flutter build web` → Output directory `build/web`.
   * **Netlify**: Build command `flutter build web` → Publish `build/web`. Or use Netlify’s Flutter plugin.
   * **GitHub Pages**: Deploy `build/web` to `gh-pages` branch via action.
2. Provide CNAME or domain instructions if a custom domain will be used.

### Step 9 — Documentation & handover

1. README with:

   * how to run locally: `flutter pub get` + `flutter run -d chrome`
   * how to run tests: `flutter test`
   * how to build: `flutter build web`
   * how to edit content (where the JSON or markdown that controls Projects lives)
   * how to replace images
2. CHANGELOG + developer notes (where to update CV or projects).

### Step 10 — QA & acceptance

1. Run Lighthouse (desktop & mobile) and aim for > 90 accessibility and best-practices where possible.
2. Validate contact form works in deployed environment (or provide full instructions if real email requires API keys).
3. Confirm all GitHub links open the correct repos and Project detail pages contain repo links.

---

# Practical content the agent should prefill (use these exact values)

Use these snippets as the portfolio content prefilled from the CV. Agent must cite the CV when using any of these facts.&#x20;

Hero headline suggestions (choose one):

* “Youssef Salem Hassan — Flutter developer building fast cross-platform apps”
* “Flutter & ML enthusiast: building beautiful mobile and web apps”

Short bio (1–2 lines):
“Flutter developer and ML practitioner. I build cross-platform mobile & web apps, and integrate machine learning into real-world applications (facial recognition, emotion analysis).”&#x20;

Key projects (one-line + 2–3 sentence description each — agent should expand using info from repos if available):

1. **Multi-Emotion Recognition for Customer Service** (Graduation Project — July 2025)
   A multimodal ML framework for analyzing audio and video to detect emotions and support mental-health diagnostics. Includes privacy-first design and model evaluation.&#x20;

2. **Music Player App** (March 2025)
   Flutter music player with playlists, playback controls, search, and a modern UI — built during an internship. Repo: `github.com/YoussefSalem582/Music-Player-App`.&#x20;

3. **Chat App** (March 2025)
   Cross-platform chat using Firebase Auth and Realtime messaging; includes light/dark modes and a polished UI. Repo: `github.com/YoussefSalem582/chat-app`.&#x20;

4. **ChargeHub App** (Sept 2024)
   EV & gas station finder with interactive maps and BLoC-based state management. Repo: `github.com/YoussefSalem582/ChargeHub-App`.&#x20;

5. **Comparative Analysis of ML Models for Street Pothole Detection** (research paper)
   Comparative research evaluating CNN, ResNet-50, and Decision Trees; shows ML and data-focused experience.&#x20;

(Agent must include all additional projects listed in the CV on the Projects page.)&#x20;

Contact links (place in header/footer):

* Email: [youssef.salem.hassan582@gmail.com](mailto:youssef.salem.hassan582@gmail.com).&#x20;
* GitHub: `github.com/YoussefSalem582`.&#x20;
* LinkedIn: `linkedin.com/in/youssef-hassan-8529372b7/`.&#x20;
* Portfolio demo: `v0-youssef-salem-hassan.vercel.app` (if already available).&#x20;

---

# Small ready-to-use snippets

### Minimal `project_card` data model (JSON)

```json
{
  "title": "Chat App",
  "short": "Cross-platform messaging with Firebase auth",
  "description": "Realtime chat, auth, dark/light mode. Built with Flutter and Firebase.",
  "tech": ["Flutter", "Firebase", "BLoC"],
  "github": "https://github.com/YoussefSalem582/chat-app",
  "demo": null,
  "image": "/assets/images/chat-app.png",
  "date": "2025-03"
}
```

### Minimal GitHub Actions (`.github/workflows/flutter-web.yml`)

```yaml
name: Flutter Web CI

on:
  push:
    branches: [ main ]
  pull_request:

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Install Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: stable
      - name: Get dependencies
        run: flutter pub get
      - name: Run tests
        run: flutter test --coverage
      - name: Build web
        run: flutter build web --release
      - name: Upload build artifact
        uses: actions/upload-artifact@v4
        with:
          name: web-build
          path: build/web
```

(Replace final deploy step with the platform you use — Vercel/Netlify/GitHub Pages.)

---

# QA checklist / Acceptance criteria

* [ ] App builds and runs locally: `flutter run -d chrome`.
* [ ] `flutter build web` produces `build/web` without errors.
* [ ] `flutter test` runs and passes all tests.
* [ ] Projects list matches the CV (titles, short descriptions, repo links).&#x20;
* [ ] Resume PDF available for download.
* [ ] Responsive design tested at mobile/tablet/desktop breakpoints.
* [ ] Basic accessibility checks (tab order, alt text, semantic labels).
* [ ] SEO meta tags set in `web/index.html`.
* [ ] CI builds run on push and artifacts are produced.
* [ ] Deployed demo is reachable (if deployment requested).

---

# Optional enhancements (bonus)

* Add light animation to hero using Lottie or simple Flutter animations.
* Add blog or “case study” pages for deep dives (markdown-driven).
* Add automated screenshot generation for each project via GitHub Actions (to populate project cards).
* Add GA4 or simple analytics (consent-first).

---

If you want, I can now:

* produce the **exact README** and `index.html` meta tags text, or
* generate the **GitHub Actions** file prefilled for Vercel or Netlify, or
* **scaffold the lib folder structure and small sample widgets** (Hero & ProjectCard) in Flutter code.

Which of those would you like me to do right now? (I can start implementing any of them immediately.)
