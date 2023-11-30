import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:watch_tv/data/utils/app_preferences.dart';

import 'csv_asset_loader.dart';

enum Languages {
  en,
  vi,
}

extension LanguageExtend on Languages {
  static Languages getLanguagesFromText(String text) {
    if (text == Languages.en.name) return Languages.en;
    if (text == Languages.vi.name) return Languages.vi;
    return defaultLanguage;
  }
}

const Languages defaultLanguage = Languages.en;
const List<Languages> supportedLocales = [Languages.en, Languages.vi];

class Localization {
  static void initApp(Widget application) {
    final Locale startLocale = Locale(currentLanguage.name);
    final Locale defaultLocale = Locale(defaultLanguage.name);
    return runApp(
      EasyLocalization(
          supportedLocales: supportedLocales.map((locale) => Locale(locale.name)).toList(),
          path: 'assets/translations/langs.csv',
          fallbackLocale: defaultLocale,
          startLocale: startLocale,
          assetLoader: CsvAssetLoader(),
          child: application),
    );
  }

  static Languages get currentLanguage {
    final AppPreferences _appPreferences = GetIt.I<AppPreferences>();
    return LanguageExtend.getLanguagesFromText(_appPreferences.appLanguage);
  }

  static Future<void> changeAppLanguage(BuildContext context, Languages newLanguage) async {
    await context.setLocale(Locale(newLanguage.name));
    _updateAppLocale(context, newLanguage.name);
    GetIt.I<AppPreferences>().saveAppLanguage(newLanguage.name);
  }

  static void _updateAppLocale(BuildContext context, String locale) {
    context.setLocale(Locale(locale));
    Intl.defaultLocale = locale;
    Intl.systemLocale = locale;
  }
}
