import 'network_exceptions.dart';

typedef SuccessCallback<T> = Future<void> Function(T data);
typedef FailureCallback = void Function(NetworkExceptions error);

mixin ApiResultMixin<T> {
  Future<void> when({required SuccessCallback<T> success, required FailureCallback failure});
}

abstract class ApiResult<T> with ApiResultMixin<T> {
  const factory ApiResult.success({required T data}) = Success<T>;

  const factory ApiResult.failure({required NetworkExceptions error}) = Failure<T>;
}

abstract class Success<T> implements ApiResult<T> {
  const factory Success({required T data}) = _SuccessImpl<T>;

  T get data;
}

class _SuccessImpl<T> implements Success<T> {
  const _SuccessImpl({required this.data});

  @override
  final T data;

  @override
  Future<void> when({required SuccessCallback<T> success, required FailureCallback failure}) async {
    return success.call(data);
  }
}

abstract class Failure<T> implements ApiResult<T> {
  const factory Failure({required NetworkExceptions error}) = _FailureImpl<T>;

  NetworkExceptions get error;
}

class _FailureImpl<T> implements Failure<T> {
  const _FailureImpl({required this.error});

  @override
  final NetworkExceptions error;

  @override
  Future<void> when({required SuccessCallback<T> success, required FailureCallback failure}) async {
    return failure(error);
  }
}
