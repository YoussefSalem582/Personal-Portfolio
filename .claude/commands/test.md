# Write tests

Write unit or widget tests for **Youssef Salem Portfolio** following existing patterns under `test/`.

## When to use

- User says "write tests", "add tests", "test this"
- After changing a use case, repository, or BLoC

## Layout

Tests live at **`test/`** (see `home_bloc_test.dart`, `projects_bloc_test.dart`, `theme_bloc_test.dart`). Prefer naming: `<area>_<type>_test.dart`. You may use `test/features/...` mirrors of `lib/features/...` when a feature grows large.

Imports use the package name:

```dart
import 'package:youssef_salem_portfolio/features/...';
```

## Failure types

Repositories/use cases return `Either<Failure, T>` (`dartz`). Common classes: `lib/core/error/failures.dart` — `ServerFailure`, `NetworkFailure`, `ValidationFailure`, `UnexpectedFailure`, `CacheFailure`, etc. Use these in `Left(...)` stubs, not copied names from other projects.

## BLoC tests

- Use **`bloc_test`** + **`mocktail`**
- `tearDown` / `bloc.close()` for BLoCs
- Mirror state names from the real feature (`HomeState`, `ProjectsFailure`, …)

## Repository / use case tests

- Mock the datasource or repository with `mocktail`
- Cover success (`Right`) and at least one failure (`Left`) path

## Widget tests

- `flutter_test`, `testWidgets`, `MaterialApp` or `MaterialApp.router` with any required `BlocProvider` / `InheritedWidget` ancestors
- Prefer finding ** semantics or keys** used in your widget rather than assuming a global `AppLoading` type

## Commands

```powershell
flutter test
flutter test test/home_bloc_test.dart
```

## Rules

- Use **`mocktail`**, not `mockito`
- This app has **no** `CachePolicy`, `OfflineQueue`, or `ConnectivityCubit` tests unless you add that infrastructure
