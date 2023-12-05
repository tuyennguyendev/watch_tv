import 'api_result.dart';
import 'network_exceptions.dart';

abstract class BaseRepository {
  ApiResult<T> handleErrorApi<T>(dynamic e) {
    final NetworkExceptions exception = NetworkExceptions.getDioException(e);
    return ApiResult.failure(error: exception);
  }

  Future<ApiResult<T>> safeCallApi<T>(Future<T> apiCall, {bool autoHandleError = true}) async {
    try {
      final response = await apiCall;
      return ApiResult.success(data: response);
    } catch (error, _) {
      return handleErrorApi<T>(error);
    }
  }
}
