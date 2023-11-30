// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen();
}

abstract class BaseState<S extends BaseScreen, C extends Cubit> extends State<S> {
  late C cubit;

  @override
  void initState() {
    initCubit();
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setup();
    });
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: buildContent(context),
    );
  }

  initCubit();

  setup();

  Widget buildContent(BuildContext context);

  hideKeyboard() {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
  }

  ///***************************************************************************
  /// NAVIGATOR
  ///***************************************************************************

  void pushScreen(BaseScreen screen) {
    print('pushScreen ===> ' + screen.runtimeType.toString());
    Navigator.push(
      context,
      CupertinoPageRoute(
        settings: RouteSettings(name: screen.runtimeType.toString()),
        builder: (context) {
          return screen;
        },
      ),
    );
  }

  void pushDialog(StatefulWidget screen) {
    Navigator.of(context).push(
      PageRouteBuilder(opaque: false, fullscreenDialog: true, pageBuilder: (_, __, ___) => screen),
    );
  }

  void replaceScreen(BaseScreen screen) {
    Navigator.popUntil(context, (route) => route.isFirst);
    print('replaceScreen ===> ${screen.runtimeType.toString()}');
    Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
            settings: RouteSettings(name: screen.runtimeType.toString()),
            builder: (context) {
              return screen;
            }));
  }

  void popScreen() {
    print('popScreen <=== ');
    Navigator.of(context).pop();
  }

  void popMultiScreen(int pop) {
    for (int i = 0; i < pop; i++) Navigator.of(context).pop();
  }

  void popUntilScreen(Type screen) {
    print('${screen.toString()} <=== popUntilScreen');
    Navigator.popUntil(
      context,
      (route) => route.isFirst || route.settings.name == screen.toString(),
    );
  }
}
