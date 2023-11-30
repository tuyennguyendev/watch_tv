import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_tv/config/app_config.dart';
import 'package:watch_tv/data/network/app_api.dart';
import 'package:watch_tv/data/utils/app_preferences.dart';

GetIt getIt = GetIt.instance;

Future setupInjection() async {
  await _registerAppComponents();
  await _registerNetworkComponents();
}

Future _registerAppComponents() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  final AppPreferences appPreferences = AppPreferences(preferences);
  getIt.registerSingleton(appPreferences);
}

Future<void> _registerNetworkComponents() async {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.getInstance().apiBaseUrl,
      connectTimeout: const Duration(seconds: 30),
    ),
  );
  _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 1000));

  _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
    //Authentication
    return handler.next(options);
  }));

  getIt.registerSingleton(AppApi(_dio, baseUrl: AppConfig.getInstance().apiBaseUrl));
}
