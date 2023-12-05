abstract class BaseResponse {
  BaseResponse({
    this.isSucceeded,
    this.errorMessage,
  });
  bool? isSucceeded;
  String? errorMessage;
}
