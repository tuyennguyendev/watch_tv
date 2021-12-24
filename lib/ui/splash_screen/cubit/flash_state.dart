part of 'flash_cubit.dart';

@immutable
abstract class FlashState {
  const FlashState();
}

class FlashInitial extends FlashState {
  const FlashInitial();
}

class FlashSuccess extends FlashState {
  const FlashSuccess();
}

class FlashFailed extends FlashState {
  const FlashFailed({this.message});
  final String? message;
}

class FlashNavigateToListChannel extends FlashState {
  const FlashNavigateToListChannel();
}

class FlashNavigateToChannel extends FlashState {
  const FlashNavigateToChannel();
}
