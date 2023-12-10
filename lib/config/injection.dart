
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_tv/config/app_config.dart';
import 'package:watch_tv/data/network/app_api.dart';
import 'package:watch_tv/data/repository/login_repo.dart';
import 'package:watch_tv/data/utils/app_preferences.dart';

import '../data/repository/iptv_source_repo.dart';

GetIt getIt = GetIt.instance;
Logger logger = Logger();

class AppInjection {
  static Future setupInjection() async {
    await _registerAppComponents();
    await _registerNetworkComponents();
  }

  static Future _registerAppComponents() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final AppPreferences appPreferences = AppPreferences(preferences);
    getIt.registerSingleton(appPreferences);
  }

  static Future<void> _registerNetworkComponents() async {
    final Dio _dio = Dio(
      BaseOptions(
        baseUrl: Environment.config.apiBaseUrl,
        connectTimeout: const Duration(seconds: 30),
      ),
    );
    // _dio.interceptors.add(PrettyDioLogger(
    //     requestHeader: true,
    //     requestBody: true,
    //     responseBody: true,
    //     responseHeader: true,
    //     error: true,
    //     compact: true,
    //     maxWidth: 1000));

    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      //Authentication
      return handler.next(options);
    }));

    getIt.registerSingleton(AppApi(_dio, baseUrl: Environment.config.apiBaseUrl));
    _registerRepo();
  }

  static void _registerRepo() {
    getIt.registerSingleton(LoginRepo());
    getIt.registerSingleton(IptvSourceRepo());
  }
}
