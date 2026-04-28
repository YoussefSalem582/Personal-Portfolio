---
name: add-language
description: Add or update ARB localization (English + Arabic) for the portfolio.
---

# Add / update localization (portfolio)

> **Context:** ARB files live at `lib/l10n/app_en.arb` and `lib/l10n/app_ar.arb` (see `l10n.yaml`).

## When to use

- New user-visible copy, new keys, or Arabic translations

## Steps

1. Add or edit keys in **`lib/l10n/app_en.arb`**.
2. Mirror keys and translate in **`lib/l10n/app_ar.arb`**.
3. Run **`flutter gen-l10n`**.
4. Use generated `AppLocalizations` / project helpers (see existing widgets for the preferred access pattern).

## New language (rare)

1. Add `lib/l10n/app_<locale>.arb` with the same keys as English.
2. Update `l10n.yaml` and `lib/app.dart` `supportedLocales` / delegates as needed.
3. Run `flutter gen-l10n`.

## Rules

- Do not ship hardcoded user-visible strings in widgets — prefer ARB.
- Keep key names `camelCase` and consistent across all ARB files.

## Docs

Update `tech_readme_files/03_Content_And_L10n/DATA_AND_LOCALIZATION.md` if you change workflow; add a line to `CHANGELOG.md` for meaningful copy or locale additions.
