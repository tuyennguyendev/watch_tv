import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_tv/ui/list_channel_screen/list_channel_screen.dart';
import 'cubit/flash_cubit.dart';

class FlashScreen extends StatelessWidget {
  const FlashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FlashCubit _cubit = FlashCubit();
    return BlocProvider(
      create: (context) => _cubit,
      child: BlocConsumer<FlashCubit, FlashState>(
        listener: (context, state) {
          if (state is FlashNavigateToListChannel) {
            Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                builder: (context) {
                  return ListChannelScreen(channelList: _cubit.channels.data);
                },
              ),
            );
          }
          if (state is FlashNavigateToChannel) {}
        },
        builder: (context, state) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
