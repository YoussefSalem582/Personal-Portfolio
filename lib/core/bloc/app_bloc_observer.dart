import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Debug logging for BLoCs (similar role to talker_bloc in technology_ninety_two_app).
/// Silent in release; logs in debug/profile via [developer.log].
class AppBlocObserver extends BlocObserver {
  const AppBlocObserver({
    this.logEvents = true,
    this.logTransitions = true,
  });

  final bool logEvents;
  final bool logTransitions;

  static bool get _silent => kReleaseMode;

  void _log(String tag, Object message, {Object? error, StackTrace? stackTrace}) {
    if (_silent) return;
    developer.log('$message', name: tag, error: error, stackTrace: stackTrace);
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    _log(bloc.runtimeType.toString(), 'created');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    if (!_silent && logEvents) {
      _log('${bloc.runtimeType}.event', '$event');
    }
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    if (!_silent && logTransitions) {
      _log(
        '${bloc.runtimeType}.transition',
        '${transition.event.runtimeType}: '
            '${transition.currentState.runtimeType} → '
            '${transition.nextState.runtimeType}',
      );
    }
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    // [Bloc]s also emit onTransition; plain Cubits only get onChange.
    if (!_silent && bloc is! Bloc<dynamic, dynamic>) {
      _log(
        '${bloc.runtimeType}.change',
        '${change.currentState.runtimeType} → ${change.nextState.runtimeType}',
      );
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    if (!_silent) {
      _log(
        '${bloc.runtimeType}.ERROR',
        error.toString(),
        error: error,
        stackTrace: stackTrace,
      );
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    _log(bloc.runtimeType.toString(), 'closed');
  }
}
