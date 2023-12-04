import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_tv/config/injection.dart';
import 'package:watch_tv/data/models/user_detail.dart';
import 'package:watch_tv/data/network/helper/network_extensions.dart';
import 'package:watch_tv/data/network/request/login_request.dart';
import 'package:watch_tv/data/repository/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitial());

  final LoginRepo _loginRepo = getIt<LoginRepo>();

  String name = '';
  String password = '';

  Future<void> login() async {
    if (name.isEmpty || password.isEmpty) return;
    // print('LOG name: $name, password: $password');
    emit(const LoginLoading());
    final LoginRequest request = LoginRequest(name: name, password: password);
    _loginRepo.login(request).easyCompose(
      (response) {
        emit(LoginSuccess(response));
      },
      onError: (error) {
        emit(
          LoginFail(message: '$error'),
        );
      },
    );
  }
}
