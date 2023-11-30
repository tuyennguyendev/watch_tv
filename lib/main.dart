import 'dart:async';
import 'package:flutter/material.dart';
import 'app.dart';
import 'config/injection.dart';
import 'localization/localization.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjection();
  Localization.initApp(const App());
}
