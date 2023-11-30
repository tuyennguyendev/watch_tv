part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  final UserDetail userDetail;
  const LoginSuccess(this.userDetail);

  @override
  List<Object> get props => [userDetail.userGender.toString(), userDetail.userAge.toString()];
}

class LoginFail extends LoginState {
  const LoginFail({this.message});

  final String? message;
}
