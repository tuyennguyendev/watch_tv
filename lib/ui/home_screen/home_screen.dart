import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_tv/base/base_screen.dart';
import 'package:watch_tv/data/models/user_detail.dart';
import 'package:watch_tv/resources/R.dart';
import 'package:watch_tv/ui/login_screen/login_screen.dart';

import 'cubit/home_cubit.dart';

class HomeScreen extends BaseScreen {
  final UserDetail userDetail;
  const HomeScreen(this.userDetail);
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen, HomeCubit> {
  @override
  onCreateView() {
    cubit = HomeCubit();
  }

  @override
  onViewCreated() {}

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          R.string.hello,
          style: TextStyle(color: R.color.white),
        ),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  R.string.name(args: ['${widget.userDetail.userName}']),
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  R.string.gender(args: ['${widget.userDetail.userGender}']),
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  R.string.age(args: ['${widget.userDetail.userAge}']),
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                MaterialButton(
                  onPressed: () {
                    replaceScreen(const LoginScreen());
                  },
                  color: R.color.blue,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    R.string.logout,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
