# Clean build

Run a full clean + regenerate cycle. Use when the build is broken, generated assets/l10n are stale, or after pulling dependency changes.

## When to use

- User says "clean build", "flutter clean", "rebuild"
- After `pubspec.yaml` or `l10n.yaml` changes
- Analyzer errors pointing at missing generated files

## Steps (PowerShell, repo root)

```powershell
flutter clean
flutter pub get
flutter gen-l10n
dart run build_runner build --delete-conflicting-outputs
flutter analyze
```

## Notes

- **`build_runner`** — Used for `flutter_gen_runner` (assets). If the project stops using codegen, you can omit the `build_runner` line.
- **`flutter gen-l10n`** — Always run after editing `lib/l10n/*.arb`.
- Do not commit `build/`, `.dart_tool/`, or machine-specific artifacts.

## iOS/Android (if you open native folders)

Only if you build mobile targets: e.g. `cd ios; pod install` when CocoaPods errors appear.
