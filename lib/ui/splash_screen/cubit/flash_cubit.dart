import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:watch_tv/models/m3u_parser.dart';

part 'flash_state.dart';

class FlashCubit extends Cubit<FlashState> {
  FlashCubit() : super(const FlashInitial()) {
    initData();
  }
  late final M3UParser channels;

  Future<void> initData() async {
    await readFileAsync('assets/iptv.m3u');
    emit(const FlashNavigateToListChannel());
  }

  Future<void> readFileAsync(String filePath) async {
    final String rawText = await rootBundle.loadString(filePath);
    channels = M3UParser(rawText);
  }
}
