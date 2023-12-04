import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:watch_tv/ui/crawl_data/crawl_data_screen.dart';
import 'package:watch_tv/utils/navigation_utils.dart';

import 'config/app_config.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Environment.config.title,
      navigatorKey: NavigationUtils.rootKey,
      debugShowCheckedModeBanner: false,
      home: const CrawlDataScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'RaleWay',
      ),
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
    );
  }
}
