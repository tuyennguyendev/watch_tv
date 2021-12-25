import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:watch_tv/models/m3u8.dart';

class ChannelScreen extends StatefulWidget {
  const ChannelScreen({
    Key? key,
    required this.channelData,
  }) : super(key: key);

  final M3U8 channelData;

  @override
  State<ChannelScreen> createState() => _ChannelScreenState();
}

class _ChannelScreenState extends State<ChannelScreen> {
  VideoPlayerController? _controller;

  bool _systemOverlaysAreVisible = false;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    super.initState();
    _controller = VideoPlayerController.network(widget.channelData.url)
      ..initialize().then((_) {
        _controller?.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_systemOverlaysAreVisible) {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
        } else {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        }
        _systemOverlaysAreVisible = !_systemOverlaysAreVisible;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: _controller?.value.isInitialized == true
              ? AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
