import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_tv/utils/const.dart';

class AppPreferences {
  AppPreferences(this.preferences);

  final SharedPreferences preferences;

  String get appLanguage {
    return preferences.getString(Const.APP_LANGUAGE) ?? 'en';
  }

  saveAppLanguage(String language) {
    return preferences.setString(Const.APP_LANGUAGE, language);
  }

  putString(String key, String value) => preferences.setString(key, value);

  String? getString(String key) => preferences.getString(key);

  putStringList(String key, List<String> value) => preferences.setStringList(key, value);

  List<String>? getStringList(String key) => preferences.getStringList(key);

  removeByKey(String key) => preferences.remove(key);
}
