# Contact form (Formspree)

## Overview

The contact section is driven by [ContactBloc](../../lib/features/contact/presentation/bloc/contact_bloc.dart). Submission goes through [SubmitContactUseCase](../../lib/features/contact/domain/usecases/submit_contact_usecase.dart) → [ContactRepository](../../lib/features/contact/domain/repositories/contact_repository.dart) → [ContactRemoteDataSourceImpl](../../lib/features/contact/data/datasources/contact_remote_datasource_impl.dart) (Dio HTTP POST).

## Configuration

Resolved at runtime via [lib/core/config/contact_runtime_config.dart](../../lib/core/config/contact_runtime_config.dart) (`ContactRuntimeConfig`):

1. **Build-time defines** (highest priority when non-empty):
   - `FORMSPREE_ENDPOINT` — full Formspree URL, e.g. `https://formspree.io/f/xxxx`
   - `CONTACT_RECIPIENT_EMAIL` — shown in some error strings / support copy

   Example:

   ```bash
   flutter run -d chrome \
     --dart-define=FORMSPREE_ENDPOINT=https://formspree.io/f/your_form \
     --dart-define=CONTACT_RECIPIENT_EMAIL=you@example.com
   ```

2. **Fallback:** [lib/core/config/api_keys.dart](../../lib/core/config/api_keys.dart) — `ApiKeys.formspreeEndpoint` / `ApiKeys.recipientEmail`.

Template for a fresh fork: [lib/core/config/api_keys.dart.template](../../lib/core/config/api_keys.dart.template).

### GitHub Actions / GitHub Pages

[.github/workflows/deploy.yml](../../.github/workflows/deploy.yml) passes defines when repository **Secrets** are set:

| Secret | Maps to |
|--------|---------|
| `FORMSPREE_ENDPOINT` | `--dart-define=FORMSPREE_ENDPOINT` |
| `CONTACT_RECIPIENT_EMAIL` | `--dart-define=CONTACT_RECIPIENT_EMAIL` |

If secrets are empty, the workflow still builds and uses `api_keys.dart` values.

Local **Windows** / **Unix** optimized builds (`scripts/build_optimized.ps1`, `scripts/build_optimized.sh`) read the same variables from the environment when set. Commented examples: [`.env.example`](../../.env.example).

See also: [DEPLOYMENT.md](DEPLOYMENT.md) for CI secrets and local script parity.

## UI entry points

- Section wrapper: [lib/features/contact/presentation/widgets/contact_section.dart](../../lib/features/contact/presentation/widgets/contact_section.dart)
- Form fields + `BlocConsumer`: [lib/core/widgets/contact_section/contact_form_widget.dart](../../lib/core/widgets/contact_section/contact_form_widget.dart)

## Errors

Typed failures: [lib/features/contact/domain/contact_submit_error.dart](../../lib/features/contact/domain/contact_submit_error.dart), mapped to l10n in the form widget.

## Testing

There is no default integration test against Formspree (would need mocks / golden env). Unit tests can mock `ContactRepository` if you add them.
