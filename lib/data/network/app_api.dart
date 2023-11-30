import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'request/login_request.dart';
import 'response/user_detail_response.dart';

part 'app_api.g.dart';

@RestApi()
abstract class AppApi {
  factory AppApi(Dio dio, {String baseUrl}) = _AppApi;

  @POST('/login')
  Future<UserDetailResponse> loginWithNameAndPassword(@Body() LoginRequest loginEmailParam);
}
