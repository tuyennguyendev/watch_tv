import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watch_tv/models/m3u8.dart';
import 'package:watch_tv/ui/channel_screen/channel_screen.dart';

class ListChannelScreen extends StatelessWidget {
  const ListChannelScreen({
    Key? key,
    required this.channelList,
  }) : super(key: key);
  final List<M3U8> channelList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: List.generate(
            channelList.length,
            (index) => _buildChannel(channelList[index], onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) {
                    return ChannelScreen(channelData: channelList[index]);
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildChannel(M3U8 channelData, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: CachedNetworkImage(
        imageUrl: channelData.tvgLogo,
        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
