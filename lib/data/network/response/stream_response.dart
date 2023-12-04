import 'package:json_annotation/json_annotation.dart';

part 'stream_response.g.dart';

@JsonSerializable()
class StreamResponse {
  final String? channel;
  final String? url;
  final String? timeshift;
  @JsonKey(name: 'http_referrer')
  final String? httpReferrer;
  @JsonKey(name: 'user_agent')
  final String? userAgent;

  const StreamResponse({
    this.channel,
    this.url,
    this.timeshift,
    this.httpReferrer,
    this.userAgent,
  });

  factory StreamResponse.fromJson(Map<String, dynamic> json) => _$StreamResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StreamResponseToJson(this);
}
