// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class NetworkHelper {
  static Future<bool> isNetworkConnected() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static Future<String> getNetworkErrorMessage(error) async {
    print('******************************** NETWORK EXCEPTION ********************************');
    // print("* Exception: " + error?.toString());
    print('***********************************************************************************');
    String errorMessage = 'Network is disconnected. Please try again later';
    if (error != null && error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          errorMessage = 'Network is disconnected. Please try again later';
          break;
        case DioExceptionType.badResponse:
          errorMessage = _parseResponseError(error);
          break;
        default:
          errorMessage = 'Could not connect to server';
          break;
      }
    }
    return errorMessage;
  }

  static dynamic _parseResponseError(error) {
    try {
      final dynamic messages = error.response.data['message'];
      return getErrorMsg(messages);
    } catch (e) {
      try {
        final Map<String, dynamic> map = jsonDecode(error.response.data);
        final dynamic messages = map['message'];
        return getErrorMsg(messages);
      } catch (e) {
        return 'Could not connect to server';
      }
    }
  }

  static dynamic getErrorMsg(dynamic messages) {
    if (messages is String) {
      return messages;
    }
    if (messages is List) {
      if (messages.isNotEmpty) {
        return messages[0];
      }
    }
    return 'Unknown Error';
  }

  static Future<String?>? getNetworkErrorCode(error) async {
    String? errorCode;
    if (error != null && error is DioException) {
      switch (error.type) {
        case DioExceptionType.badResponse:
          errorCode = _parseResponseCodeError(error);
          break;
        default:
          break;
      }
    }
    return errorCode;
  }

  static String? _parseResponseCodeError(error) {
    try {
      return error.response.data['code'] as String;
    } catch (e) {
      try {
        final Map<String, dynamic> map = jsonDecode(error.response.data);
        return map['code'] as String;
      } catch (e) {
        return null;
      }
    }
  }
}
