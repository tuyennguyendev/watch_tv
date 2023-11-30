import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_tv/utils/const.dart';

class SessionPreferences {
  // Singleton
  SessionPreferences._();

  static final SessionPreferences _instance = SessionPreferences._();

  factory SessionPreferences() {
    return _instance;
  }

  // Shared instance
  final Future<SharedPreferences> _sharedPreference = SharedPreferences.getInstance();

  Future<String?> get authToken async {
    return _sharedPreference.then((preference) {
      return preference.getString(Const.TOKEN);
    });
  }

  Future<void> saveStatusLogged(bool isLogged) async {
    return _sharedPreference.then((preference) {
      return preference.setBool(Const.STATUS_LOGGED, isLogged);
    });
  }

  Future<void> removeStatusLogged() async {
    return _sharedPreference.then((preference) {
      return preference.remove(Const.STATUS_LOGGED);
    });
  }

  Future<void> saveAuthToken(String authToken) async {
    return _sharedPreference.then((preference) {
      return preference.setString(Const.TOKEN, authToken);
    });
  }

  Future<void> removeAuthToken() async {
    return _sharedPreference.then((preference) {
      return preference.remove(Const.TOKEN);
    });
  }

  logout() async {
    await removeAuthToken();
    await removeStatusLogged();
  }
}
