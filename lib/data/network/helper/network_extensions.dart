import 'dart:async';

extension NetworkExtensionsResponse<T> on Future<T> {
  easyCompose(
    response(T data), {
    bool acceptNullData = false,
    required Function(dynamic error) onError,
  }) {
    this.then(
      (res) {
        if (!acceptNullData && res == null) {
          if (onError != null) {
            onError(Object());
          }
        } else {
          response(res);
        }
      },
      onError: (error) {
        if (onError != null) {
          onError(error);
        }
      },
    );
  }
}
