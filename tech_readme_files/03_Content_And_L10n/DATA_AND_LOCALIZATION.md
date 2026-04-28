# Content and localization

## Static portfolio data

Primary location: [lib/utils/data/](../../lib/utils/data/).

Common files:

- `portfolio_data.dart` — aggregator / wiring
- `personal_info_data.dart`, `projects_data.dart`, `skills_data.dart`, `certificates_data.dart`, `expertise_data.dart`, `contact_data.dart`, …

Feature **datasources** call into these helpers rather than embedding long strings in blocs.

## Models

Shared types: [lib/models/](../../lib/models/) (`Project`, `Certificate`, `Skill`, …).

## English UI strings

- ARB: [lib/l10n/app_en.arb](../../lib/l10n/app_en.arb), [lib/l10n/app_ar.arb](../../lib/l10n/app_ar.arb)
- Generated API: `AppLocalizations.of(context)`

## Arabic content for entities

Extensions in [lib/core/localization/localized_extensions.dart](../../lib/core/localization/localized_extensions.dart) switch copy when `AppLocaleBinding.isArabic` is true, using maps in:

- `features/projects/data/localized/projects_ar.dart`
- `features/skills/data/localized/skills_category_ar.dart`
- `features/expertise/data/localized/expertise_ar.dart`
- `features/certificates/data/localized/certificates_ar.dart`
- (and other `*_ar.dart` next to features)

`AppLocaleBinding` is refreshed from [LocaleBloc](../../lib/features/locale/presentation/bloc/locale_bloc.dart) in [lib/app.dart](../../lib/app.dart).

## Changing content safely

1. Prefer editing **utils/data** and **models** first.
2. If you add fields, update entity + datasource + any AR overlays.
3. Run `flutter gen-l10n` if you change ARB (often automatic on build).
