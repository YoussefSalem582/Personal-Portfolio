# Quick start (developers)

## Prerequisites

- Flutter SDK (stable channel), Dart SDK
- Chrome (recommended for `flutter run -d chrome`)

## Setup

```bash
git clone https://github.com/YoussefSalem582/Youssef-Hassan-Portfolio.git
cd Youssef-Hassan-Portfolio
flutter pub get
```

## Run locally

```bash
flutter run -d chrome
```

## Analyze and test

```bash
dart analyze
flutter test
```

Relevant tests today (non-exhaustive):

- `test/home_bloc_test.dart`
- `test/projects_bloc_test.dart`
- `test/projects_repository_test.dart`
- `test/theme_bloc_test.dart`

## Production web build (GitHub Pages)

The site is often hosted under a **subpath** (example):

```bash
flutter build web --release --base-href "/Youssef-Hassan-Portfolio/" --no-source-maps
```

Exact CI and local build: [04_Contact_And_Deploy/DEPLOYMENT.md](../04_Contact_And_Deploy/DEPLOYMENT.md). Windows one-liner from repo root: `.\scripts\build_optimized.ps1`. macOS / Linux: `chmod +x ./scripts/build_optimized.sh && ./scripts/build_optimized.sh`.

## Key entry files

| File | Role |
|------|------|
| [lib/main.dart](../../lib/main.dart) | `initDependencies()`, `runApp` |
| [lib/app.dart](../../lib/app.dart) | `MaterialApp.router`, global theme/locale BLoCs |
| [lib/injection_container.dart](../../lib/injection_container.dart) | GetIt `sl` registrations |
| [lib/config/routes/app_router.dart](../../lib/config/routes/app_router.dart) | `GoRouter` factory |
