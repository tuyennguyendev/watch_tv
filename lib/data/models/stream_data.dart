import 'package:watch_tv/data/network/response/stream_response.dart';

class StreamData {
  const StreamData({
    this.channel,
    this.url,
    this.timeshift,
    this.httpReferrer,
    this.userAgent,
  });

  final String? channel;
  final String? url;
  final String? timeshift;
  final String? httpReferrer;
  final String? userAgent;

  factory StreamData.fromStreamResponse(StreamResponse data) {
    return StreamData(
      channel: data.channel,
      url: data.url,
      timeshift: data.timeshift,
      httpReferrer: data.httpReferrer,
      userAgent: data.userAgent,
    );
  }
}
