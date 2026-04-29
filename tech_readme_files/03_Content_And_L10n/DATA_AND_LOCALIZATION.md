# Content and localization

## Static portfolio data

Primary location: **`lib/features/<name>/data/local/`** (per feature).

Examples:

- [lib/features/projects/data/local/projects_data.dart](../../lib/features/projects/data/local/projects_data.dart)
- [lib/features/hero/data/local/personal_info_data.dart](../../lib/features/hero/data/local/personal_info_data.dart)
- [lib/features/skills/data/local/skills_data.dart](../../lib/features/skills/data/local/skills_data.dart)

Feature **datasources** load from these (and from `localized/` maps) rather than embedding long strings only in blocs.

## Domain types (entities)

Per-feature models under **`lib/features/<name>/domain/entities/`**, for example:

- [project.dart](../../lib/features/projects/domain/entities/project.dart)
- [certificate.dart](../../lib/features/certificates/domain/entities/certificate.dart)
- [skill.dart](../../lib/features/skills/domain/entities/skill.dart)

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

1. Prefer editing **`features/<name>/data/local/`** and the relevant **`domain/entities`** first.
2. If you add fields, update entity + datasource + any AR overlays.
3. Run `flutter gen-l10n` if you change ARB (often automatic on build).
