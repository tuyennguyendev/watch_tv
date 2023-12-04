// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreamResponse _$StreamResponseFromJson(Map<String, dynamic> json) =>
    StreamResponse(
      channel: json['channel'] as String?,
      url: json['url'] as String?,
      timeshift: json['timeshift'] as String?,
      httpReferrer: json['http_referrer'] as String?,
      userAgent: json['user_agent'] as String?,
    );

Map<String, dynamic> _$StreamResponseToJson(StreamResponse instance) =>
    <String, dynamic>{
      'channel': instance.channel,
      'url': instance.url,
      'timeshift': instance.timeshift,
      'http_referrer': instance.httpReferrer,
      'user_agent': instance.userAgent,
    };
