# BLoC patterns

- Separate files: `*_event.dart`, `*_state.dart`, `*_bloc.dart`.
- Events and states extend `Equatable` with correct `props`.
- Register BLoCs as **`registerFactory`** in `lib/injection_container.dart` when each screen/section needs a fresh instance; use lazy singletons for repositories and use cases.
- Provide blocs with `BlocProvider` at the appropriate subtree (often section or page).

Portfolio sections (hero, about, skills, etc.) follow this pattern — mirror an existing feature when adding behavior.
