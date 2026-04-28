# Feature modules (convention)

## Folder layout

Example for a read-only section (e.g. `hero`):

```
lib/features/<name>/
├── data/
│   ├── datasources/<name>_local_datasource.dart
│   ├── datasources/<name>_local_datasource_impl.dart
│   ├── repositories/<name>_repository_impl.dart
│   └── localized/          # optional: *_ar.dart
├── domain/
│   ├── entities/
│   ├── repositories/<name>_repository.dart
│   └── usecases/load_<name>_content_usecase.dart
└── presentation/
    ├── bloc/<name>_bloc.dart
    ├── bloc/<name>_event.dart
    ├── bloc/<name>_state.dart
    └── <section widgets / pages>
```

`projects` adds case-study-only widgets under `presentation/widgets/project_case_study/` and extra domain types (e.g. filters).

`contact` adds `contact_remote_datasource` for Formspree.

`home` keeps scroll/navigation UI in `presentation/pages/`; domain includes [HomeLayout](../../lib/features/home/domain/entities/home_layout.dart) and bootstrap rules in the local datasource.

## BLoC pattern

- **Events**: sealed / `final class` types extending `Equatable` where helpful.
- **States**: `Initial` / `Loading` / `Loaded` / `Failure` for loaders; **`ContactState`** uses `copyWith` for form status.
- **Startup**: most section blocs `add(const XStarted())` in the constructor after registering `on<XStarted>`.

## Where to put shared widgets

Cross-feature UI (navigation bar, generic cards) stays under [lib/widgets/](../../lib/widgets/). Feature-specific section composition lives under `features/<name>/presentation/`.

## Localization

- Generated: [lib/l10n/](../../lib/l10n/) (ARB + `AppLocalizations`).
- Arabic overlays for portfolio entities: [lib/core/localization/localized_extensions.dart](../../lib/core/localization/localized_extensions.dart) + per-feature `data/localized/*_ar.dart`.
