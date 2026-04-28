import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'core/bloc/app_bloc_observer.dart';
import 'injection_container.dart';

/// Main entry point - Static Portfolio App
/// No backend dependencies - uses only local assets and data
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = const AppBlocObserver();

  if (kIsWeb) {
    PaintingBinding.instance.imageCache.maximumSize = 50;
    PaintingBinding.instance.imageCache.maximumSizeBytes = 50 * 1024 * 1024;
  }

  await initDependencies();

  runApp(const PortfolioApp());
}
