import 'package:watch_tv/config/injection.dart';
import '../models/user_detail.dart';
import '../network/app_api.dart';
import '../network/request/login_request.dart';

class LoginRepo {
  final AppApi _appApi = getIt<AppApi>();

  Future<UserDetail> login(LoginRequest loginRequest) async {
    final response = await _appApi.loginWithNameAndPassword(loginRequest);
    return response.userDetail;
  }
}
