// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guide_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuideResponse _$GuideResponseFromJson(Map<String, dynamic> json) =>
    GuideResponse(
      channel: json['channel'] as String?,
      site: json['site'] as String?,
      siteId: json['site_id'] as String?,
      siteName: json['site_name'] as String?,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$GuideResponseToJson(GuideResponse instance) =>
    <String, dynamic>{
      'channel': instance.channel,
      'site': instance.site,
      'site_id': instance.siteId,
      'site_name': instance.siteName,
      'lang': instance.lang,
    };
