import 'package:json_annotation/json_annotation.dart';

import '../network/response/stream_response.dart';
import 'base_model.dart';

part 'streams_data.g.dart';

@JsonSerializable()
class StreamsData extends BaseModel {
  const StreamsData({
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

  bool get hasValidUrl {
    if (url == null) return false;
    // if (url?.startsWith('https://') != true) return false;
    return true;
  }

  factory StreamsData.fromJson(Map<String, dynamic> json) => _$StreamsDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StreamsDataToJson(this);

  factory StreamsData.fromStreamResponse(StreamResponse data) {
    return StreamsData(
      channel: data.channel,
      url: data.url,
      timeshift: data.timeshift,
      httpReferrer: data.httpReferrer,
      userAgent: data.userAgent,
    );
  }
}
