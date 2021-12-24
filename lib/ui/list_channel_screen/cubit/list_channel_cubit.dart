import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'list_channel_state.dart';

class ListChannelCubit extends Cubit<ListChannelState> {
  ListChannelCubit() : super(const ListChannelInitial());
}
