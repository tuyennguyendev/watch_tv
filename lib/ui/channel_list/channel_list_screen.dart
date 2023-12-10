import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:watch_tv/base/base_screen.dart';
import 'package:watch_tv/data/models/channel_data.dart';
import 'package:watch_tv/ui/stream/stream_screen.dart';
import 'cubit/channel_list_cubit.dart';

class ChannelListScreen extends BaseScreen {
  const ChannelListScreen({super.key, required this.channels});
  final List<ChannelData> channels;

  @override
  State<ChannelListScreen> createState() => _ChannelListScreenState();
}

class _ChannelListScreenState extends BaseState<ChannelListScreen, ChannelListCubit> {
  @override
  onCreateView() {
    cubit = ChannelListCubit();
  }

  @override
  onViewCreated() {}

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
      itemCount: widget.channels.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            pushScreen(StreamScreen(channelData: widget.channels[index]));
          },
          child: Card(
            child: CachedNetworkImage(imageUrl: widget.channels[index].logo ?? ''),
          ),
        );
      },
    ));
  }
}
