import 'dart:io';

import 'package:dio/dio.dart';
import 'package:watch_tv/resources/R.dart';
import 'package:watch_tv/utils/const.dart';
import 'package:watch_tv/utils/dio_error_extension.dart';

class NetworkExceptions {
  factory NetworkExceptions.defaultError(String error) => DefaultErrorException(error);
  factory NetworkExceptions.dioNetworkError(DioException error) => DioNetworkErrorException(error.errorMessage);
  factory NetworkExceptions.formatError() => FormatException();
  factory NetworkExceptions.internalServerError() => InternalServerErrorException();
  factory NetworkExceptions.noInternetConnection() => NoInternetConnectionException();
  factory NetworkExceptions.none() => NoException();
  factory NetworkExceptions.notFound() => NotFoundException();
  factory NetworkExceptions.serviceUnavailable() => ServiceUnavailableException();
  factory NetworkExceptions.unauthorized(String error) => UnauthorizedException(error);
  factory NetworkExceptions.cancel() => CancelledException();
  factory NetworkExceptions.unexpected() => UnexpectedException();

  NetworkExceptions(this.errorMessage);
  final String errorMessage;

  static NetworkExceptions handleResponse(DioException dioException) {
    if (dioException.error is SocketException) {
      return NetworkExceptions.noInternetConnection();
    }
    if (dioException.type == DioExceptionType.cancel) return NetworkExceptions.cancel();
    if (dioException.type != DioExceptionType.badResponse) return NetworkExceptions.dioNetworkError(dioException);
    switch (dioException.response?.statusCode) {
      case Const.NETWORK_ERROR_CODE_UNAUTHORIZE:
        return NetworkExceptions.unauthorized(R.string.error_unauthorized_request);
      case Const.NETWORK_ERROR_CODE_NOT_FOUND:
        return NetworkExceptions.notFound();
      case Const.NETWORK_ERROR_CODE_INTERNAL_SERVER:
        return NetworkExceptions.internalServerError();
      case Const.NETWORK_ERROR_CODE_SERVICE_UNAVAILABLE:
        return NetworkExceptions.serviceUnavailable();
      case Const.NETWORK_ERROR_CODE_BAD_REQUEST:
        final errorMessage = dioException.response?.data['error'];
        return NetworkExceptions.defaultError(errorMessage);
      default:
        return NetworkExceptions.defaultError(
            R.string.error_invalid_status_code(args: ['${dioException.response?.statusCode}']));
    }
  }

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions exception;
        if (error is DioException) {
          exception = NetworkExceptions.handleResponse(error);
        } else {
          exception = NetworkExceptions.unexpected();
        }
        return exception;
      } on FormatException catch (_) {
        return NetworkExceptions.formatError();
      } catch (_) {
        return NetworkExceptions.unexpected();
      }
    } else {
      return NetworkExceptions.unexpected();
    }
  }
}

class UnauthorizedException extends NetworkExceptions {
  UnauthorizedException(String errorMessage) : super(errorMessage);
}

class CancelledException extends NetworkExceptions {
  CancelledException() : super('');
}

class NotFoundException extends NetworkExceptions {
  NotFoundException() : super(R.string.error_api_not_found);
}

class InternalServerErrorException extends NetworkExceptions {
  InternalServerErrorException() : super(R.string.error_internet_server_error);
}

class ServiceUnavailableException extends NetworkExceptions {
  ServiceUnavailableException() : super(R.string.error_service_unavailable);
}

class FormatException extends NetworkExceptions {
  FormatException() : super(R.string.error_unexpected_error);
}

class DefaultErrorException extends NetworkExceptions {
  DefaultErrorException(String errorMessage) : super(errorMessage);
}

class DioNetworkErrorException extends NetworkExceptions {
  DioNetworkErrorException(String errorMessage) : super(errorMessage);
}

class NoInternetConnectionException extends NetworkExceptions {
  NoInternetConnectionException() : super(R.string.error_no_network_connection);
}

class UnexpectedException extends NetworkExceptions {
  UnexpectedException() : super(R.string.error_unexpected_error);
}

class NoException extends NetworkExceptions {
  NoException() : super('');
}
