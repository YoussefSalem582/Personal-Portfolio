# Youssef Salem - Flutter Developer Portfolio

![Visitor Count](https://hits.sh/https://youssef-salem-portfolio.vercel.app.svg?style=flat-square&label=Visitors&color=3498db&labelColor=2c3e50)
![Vercel](https://img.shields.io/badge/Deployed-Vercel-000000?style=flat-square&logo=vercel&logoColor=white)
![Flutter](https://img.shields.io/badge/Built%20with-Flutter-02569B?style=flat-square&logo=flutter)

A modern, responsive portfolio website showcasing Flutter development skills, machine learning projects, and professional achievements. Built with Flutter Web and optimized for performance and accessibility.

## 🚀 Live Demo

Visit the live portfolio: [https://youssef-salem-portfolio.vercel.app/](https://youssef-salem-portfolio.vercel.app/)

## ⚡ Performance

- **Initial Load**: 1-2 seconds (75% faster with optimizations)
- **Repeat Load**: <1 second (Service Worker caching)
- **Lighthouse Score**: 90+ (Performance, Accessibility, SEO)
- **Bundle Size**: depends on renderer/engine (release `flutter build web` is tree-shaken)
- **Offline Support**: PWA with Service Worker

## ✨ Features

- **Responsive Design**: Optimized for mobile, tablet, and desktop
- **Modern UI/UX**: Clean, professional design with smooth animations
- **Project Galleries**: Interactive project cards with image carousels
- **Certificates Section**: Professional achievements and certifications
- **SEO Optimized**: Complete meta tags and Open Graph support
- **Accessibility**: WCAG compliant with proper semantic structure
- **Performance**: Lazy loading, service worker caching, optimized release builds
- **CI/CD**: Automated optimized deployment with GitHub Actions
- **PWA Ready**: Installable on mobile and desktop devices

## 🛠️ Tech Stack

- **Framework**: Flutter Web
- **Language**: Dart
- **State management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc) (section-level BLoCs)
- **Dependency injection**: [get_it](https://pub.dev/packages/get_it)
- **Routing**: [go_router](https://pub.dev/packages/go_router)
- **Styling**: Custom theme with responsive design (`responsive_framework`)
- **Contact form**: Formspree via Dio (see `lib/core/config/api_keys.dart` and `contact_runtime_config.dart`)
- **Testing**: Flutter Test, `bloc_test`, `mocktail`
- **CI/CD**: GitHub Actions
- **Deployment**: Vercel (GitHub Actions → static `build/web`)

## 📦 Dependencies

See [`pubspec.yaml`](pubspec.yaml) for exact versions. Main packages include `flutter_bloc`, `go_router`, `get_it`, `dio`, `dartz`, `equatable`, `shared_preferences`, and `responsive_framework`.

## 🏃‍♂️ Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- Web browser (Chrome recommended for development)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/YoussefSalem582/Youssef-Salem-Portfolio.git
   cd Youssef-Salem-Portfolio
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app locally**
   ```bash
   flutter run -d chrome
   ```

4. **Build for production (optimized, matches CI)**
   ```powershell
   # Windows
   .\scripts\build_optimized.ps1
   ```
   ```bash
   # macOS / Linux
   chmod +x ./scripts/build_optimized.sh && ./scripts/build_optimized.sh
   ```

   Manual equivalent (same flags as [.github/workflows/deploy.yml](.github/workflows/deploy.yml)):
   ```bash
   flutter build web --release --base-href "/" --no-source-maps
   ```
   Then copy `web/service-worker.js`, `web/.htaccess`, `web/_headers`, and [`vercel.json`](vercel.json) into `build/web` if present.

### Development Commands

```bash
# Run with hot reload
flutter run -d chrome

# Run tests
flutter test

# Run tests with coverage
flutter test --coverage

# Build optimized for production (Windows / matches CI)
.\scripts\build_optimized.ps1

# Build optimized (macOS / Linux)
./scripts/build_optimized.sh

# Analyze code
dart analyze
```

## 📁 Project Structure

```
lib/
├── main.dart                    # Entry: DI init, runApp
├── app.dart                     # MaterialApp.router, theme/locale BLoCs
├── injection_container.dart     # get_it registrations
├── core/
│   ├── config/                  # app_config, api keys, contact_runtime_config, routes/app_router
│   ├── routes/app_routes.dart   # path constants
│   ├── theme/app_theme.dart
│   ├── locale/, localization/
│   ├── utils/assets/            # AppColors, fonts, constants; flutter_gen output (e.g. assets.gen.dart)
│   └── widgets/                 # Shared section UI (nav, cards, contact form, …)
├── features/                    # Feature-first modules (data / domain / presentation)
│   ├── home/                    # Portfolio shell; HomeBloc + PortfolioPage
│   ├── hero/, about/, skills/, expertise/, projects/, certificates/, contact/
│   ├── theme/, locale/
│   └── ...                      # each feature: data/local/, data/localized/, domain/entities/, …
├── l10n/                        # Generated + ARB localizations
└── …

assets/                          # Images, documents, fonts (see pubspec)

test/                            # e.g. *_bloc_test.dart, *_repository_test.dart
```

**Contributor-oriented technical docs** (architecture, DI, routing, l10n): [tech_readme_files/README.md](tech_readme_files/README.md).

## 🎨 Customization

### Updating Portfolio Content

1. **Per-feature data**: Static lists and copy live in **`lib/features/<name>/data/local/`** (e.g. [`lib/features/projects/data/local/projects_data.dart`](lib/features/projects/data/local/projects_data.dart), [`lib/features/hero/data/local/personal_info_data.dart`](lib/features/hero/data/local/personal_info_data.dart), skills/certificates as appropriate).
2. **Projects / case studies**: Types in [`lib/features/projects/domain/entities/`](lib/features/projects/domain/entities/); narrative and case study content alongside [`lib/features/projects/data/`](lib/features/projects/data/).
3. **Arabic overlays**: Per-feature files under each `features/<name>/data/localized/`.
4. **Theme**: [`lib/core/theme/app_theme.dart`](lib/core/theme/app_theme.dart) and [`lib/core/utils/assets/app_constants.dart`](lib/core/utils/assets/app_constants.dart).

### Adding New Images

1. Place images in `assets/images/projects/[project-name]/`
2. Update `pubspec.yaml` to include new asset paths
3. Update project data to reference new images

### Theme Customization

Edit [`lib/core/theme/app_theme.dart`](lib/core/theme/app_theme.dart) to customize:
- Colors and gradients
- Typography
- Spacing
- Border radius
- Shadows

## 🚀 Deployment

### GitHub Actions → Vercel (recommended)

Workflow: [.github/workflows/deploy.yml](.github/workflows/deploy.yml). On push to **`master`**, it builds **`build/web`** with `--base-href "/"`, copies [`vercel.json`](vercel.json) into `build/web`, and runs **`vercel deploy --prod`** against that folder.

**Repository secrets:** `VERCEL_TOKEN`, `VERCEL_ORG_ID`, `VERCEL_PROJECT_ID`. Optional: `SITE_BASE_URL` (canonical hostname / custom domain), plus Formspree secrets (`FORMSPREE_ENDPOINT`, `CONTACT_RECIPIENT_EMAIL`) — see [tech_readme_files/04_Contact_And_Deploy/DEPLOYMENT.md](tech_readme_files/04_Contact_And_Deploy/DEPLOYMENT.md).

Push to `master` or run the workflow manually via **Actions**.

### Local build (preview)

Use the same output CI uses:

```powershell
.\scripts\build_optimized.ps1
```

```bash
chmod +x ./scripts/build_optimized.sh && ./scripts/build_optimized.sh
```

Artifact: **`build/web`**.

### Manual one-off build

```bash
flutter build web --release --base-href "/" --no-source-maps
```

Then copy `web/service-worker.js`, optional `web/.htaccess`, `web/_headers`, and [`vercel.json`](vercel.json) into `build/web`.

### Environment / API keys

- **Default:** [`lib/core/config/api_keys.dart`](lib/core/config/api_keys.dart) (`ApiKeys.formspreeEndpoint`, `ApiKeys.recipientEmail`). See [`lib/core/config/api_keys.dart.template`](lib/core/config/api_keys.dart.template) for a blank template.
- **Overrides:** at build/run time, [`lib/core/config/contact_runtime_config.dart`](lib/core/config/contact_runtime_config.dart) prefers `--dart-define=FORMSPREE_ENDPOINT=...` and `--dart-define=CONTACT_RECIPIENT_EMAIL=...`. [`AppConfig.siteBaseUrl`](lib/core/config/app_config.dart) accepts `--dart-define=SITE_BASE_URL=...` (GitHub Actions optional secret **`SITE_BASE_URL`**). GitHub Actions can use repository **Secrets** with the same names (see [`tech_readme_files/04_Contact_And_Deploy/CONTACT_FORM.md`](tech_readme_files/04_Contact_And_Deploy/CONTACT_FORM.md) and [`tech_readme_files/04_Contact_And_Deploy/DEPLOYMENT.md`](tech_readme_files/04_Contact_And_Deploy/DEPLOYMENT.md)). Shell examples: [`.env.example`](.env.example) (not loaded by Flutter—export vars or use IDE defines).

## 🧪 Testing

The project includes comprehensive tests:

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/home_bloc_test.dart
```

### Test Coverage

- **BLoC / repository tests**: e.g. `home_bloc_test.dart`, `projects_bloc_test.dart`, `projects_repository_test.dart`, `theme_bloc_test.dart`

## 📊 Performance

- **Lighthouse Score**: 90+ (Performance, Accessibility, Best Practices, SEO)
- **Bundle Size**: Optimized with tree-shaking
- **Image Optimization**: WebP format where supported
- **Lazy Loading**: Non-critical images loaded on demand

## 🔧 Development Tools

- **VS Code Extensions**:
  - Flutter
  - Dart
  - Flutter Widget Snippets
  - GitLens

- **Debugging**:
  - Flutter Inspector
  - Chrome DevTools
  - Network tab for asset loading

## 📱 Browser Support

- Chrome (recommended)
- Firefox
- Safari
- Edge
- Mobile browsers (iOS Safari, Chrome Mobile)

## 🤝 Contributing

For structure, tooling, and AI assistant conventions, see [`tech_readme_files/README.md`](tech_readme_files/README.md), [`AGENTS.md`](AGENTS.md), and [`CLAUDE.md`](CLAUDE.md).

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Contact

**Youssef Salem**
- Email: [youssef.salem.hassan582@gmail.com](mailto:youssef.salem.hassan582@gmail.com)
- LinkedIn: [linkedin.com/in/youssef-hassan-8529372b7/](https://www.linkedin.com/in/youssef-hassan-8529372b7/)
- GitHub: [github.com/YoussefSalem582](https://github.com/YoussefSalem582)
- Portfolio: [youssef-salem-portfolio.vercel.app](https://youssef-salem-portfolio.vercel.app/)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Open source community for packages and inspiration
- Design inspiration from modern portfolio websites

---

**Built with ❤️ using Flutter**