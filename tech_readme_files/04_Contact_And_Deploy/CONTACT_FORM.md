# Contact form (Formspree)

## Overview

The contact section is driven by [ContactBloc](../../lib/features/contact/presentation/bloc/contact_bloc.dart). Submission goes through [SubmitContactUseCase](../../lib/features/contact/domain/usecases/submit_contact_usecase.dart) → [ContactRepository](../../lib/features/contact/domain/repositories/contact_repository.dart) → [ContactRemoteDataSourceImpl](../../lib/features/contact/data/datasources/contact_remote_datasource_impl.dart) (Dio HTTP POST).

## Configuration

Endpoint: [lib/config/api_keys.dart](../../lib/config/api_keys.dart) — `ApiKeys.formspreeEndpoint`.

Template for local setup: [lib/config/api_keys.dart.template](../../lib/config/api_keys.dart.template).

## UI entry points

- Section wrapper: [lib/features/contact/presentation/widgets/contact_section.dart](../../lib/features/contact/presentation/widgets/contact_section.dart)
- Form fields + `BlocConsumer`: [lib/widgets/contact_section/contact_form_widget.dart](../../lib/widgets/contact_section/contact_form_widget.dart)

## Errors

Typed failures: [lib/features/contact/domain/contact_submit_error.dart](../../lib/features/contact/domain/contact_submit_error.dart), mapped to l10n in the form widget.

## Testing

There is no default integration test against Formspree (would need mocks / golden env). Unit tests can mock `ContactRepository` if you add them.
