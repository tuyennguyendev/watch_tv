import 'package:dio/dio.dart';
import 'package:watch_tv/resources/R.dart';

extension DioExceptionExtension on DioException {
  String get errorMessage {
    switch (this.type) {
      case DioExceptionType.cancel:
        return R.string.error_request_canceled;
      case DioExceptionType.connectionTimeout:
        return R.string.error_request_timeout;
      case DioExceptionType.sendTimeout:
        return R.string.error_send_timeout;
      case DioExceptionType.receiveTimeout:
        return R.string.error_receive_timeout;
      case DioExceptionType.badCertificate:
        return R.string.error_hand_shake_msg;
      case DioExceptionType.badResponse:
        return R.string.error_bad_request;
      case DioExceptionType.connectionError:
        return R.string.error_no_network_connection;
      case DioExceptionType.unknown:
        return R.string.error_unexpected_error;
    }
  }
}
