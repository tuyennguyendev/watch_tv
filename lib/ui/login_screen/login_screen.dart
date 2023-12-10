import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_tv/base/base_screen.dart';
import 'package:watch_tv/localization/localization.dart';
import 'package:watch_tv/resources/R.dart';
import 'package:watch_tv/ui/home_screen/home_screen.dart';
import 'package:watch_tv/utils/dialog_utils.dart';

import 'login_cubit/login_cubit.dart';

class LoginScreen extends BaseScreen {
  const LoginScreen();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen, LoginCubit> {
  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          R.string.login,
          style: TextStyle(color: R.color.white),
        ),
      ),
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            DialogUtils.showLoading(context: context);
          } else {
            DialogUtils.hideLoading(context: context);
          }
          if (state is LoginSuccess) {
            replaceScreen(HomeScreen(state.userDetail));
          }
          if (state is LoginFail) {}
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.face),
                      hintText: R.string.enter_user_name,
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (email) {
                      cubit.name = email;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.password),
                      hintText: R.string.enter_password,
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (password) {
                      cubit.password = password;
                    },
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                InkWell(
                  onTap: () {
                    cubit.login();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: R.color.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      R.string.login,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (Localization.currentLanguage == Languages.vi) {
            await Localization.changeAppLanguage(context, Languages.en);
          } else {
            await Localization.changeAppLanguage(context, Languages.vi);
          }
          // print("Result : ${Localization.currentLanguage}");
          setState(() {});
        },
        child: const Icon(Icons.change_circle),
        tooltip: R.string.change_language,
      ),
    );
  }

  @override
  onCreateView() {
    cubit = LoginCubit();
  }

  @override
  onViewCreated() {}
}
