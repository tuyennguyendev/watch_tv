import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'channel_list_state.dart';

class ChannelListCubit extends Cubit<ChannelListState> {
  ChannelListCubit() : super(ChannelListInitial());
}
