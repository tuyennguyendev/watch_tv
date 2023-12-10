import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'config/injection.dart';
import 'firebase_options_dev.dart';
import 'localization/localization.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid || Platform.isIOS)
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  await AppInjection.setupInjection();
  Localization.initApp(const App());
}
