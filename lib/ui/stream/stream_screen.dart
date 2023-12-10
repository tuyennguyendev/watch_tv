import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:watch_tv/base/base_screen.dart';
import 'package:watch_tv/config/injection.dart';
import 'package:watch_tv/data/models/channel_data.dart';
import 'package:watch_tv/ui/stream/cubit/stream_cubit.dart';

class StreamScreen extends BaseScreen {
  const StreamScreen({super.key, required this.channelData});

  final ChannelData channelData;

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends BaseState<StreamScreen, StreamCubit> {
  late final VideoPlayerController _controller;

  @override
  onCreateView() {
    logger.d('Play url ${widget.channelData.streamsData?.url}');
    cubit = StreamCubit();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.channelData.streamsData?.url ?? ''))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  onViewCreated() {}

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying ? _controller.pause() : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
