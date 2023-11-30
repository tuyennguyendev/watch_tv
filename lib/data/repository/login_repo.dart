import 'package:watch_tv/config/injection.dart';
import '../models/user_detail.dart';
import '../network/app_api.dart';
import '../network/request/login_request.dart';

class LoginRepo {
  static final AppApi appApi = getIt<AppApi>();

  static Future<UserDetail> login(LoginRequest loginRequest) async {
    final response = await appApi.loginWithNameAndPassword(loginRequest);
    return response.userDetail;
  }
}
