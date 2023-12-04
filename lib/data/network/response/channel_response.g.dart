// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelResponse _$ChannelResponseFromJson(Map<String, dynamic> json) =>
    ChannelResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      altNames: (json['alt_names'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      network: json['network'] as String?,
      owners:
          (json['owners'] as List<dynamic>?)?.map((e) => e as String).toList(),
      country: json['country'] as String?,
      subdivision: json['subdivision'] as String?,
      city: json['city'] as String?,
      broadcastArea: (json['broadcast_area'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isNsfw: json['is_nsfw'] as bool?,
      launched: json['launched'] as String?,
      closed: json['closed'] as String?,
      replacedBy: json['replaced_by'] as String?,
      website: json['website'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$ChannelResponseToJson(ChannelResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alt_names': instance.altNames,
      'network': instance.network,
      'owners': instance.owners,
      'country': instance.country,
      'subdivision': instance.subdivision,
      'city': instance.city,
      'broadcast_area': instance.broadcastArea,
      'languages': instance.languages,
      'categories': instance.categories,
      'is_nsfw': instance.isNsfw,
      'launched': instance.launched,
      'closed': instance.closed,
      'replaced_by': instance.replacedBy,
      'website': instance.website,
      'logo': instance.logo,
    };
