import 'package:json_annotation/json_annotation.dart';

import '../network/response/channel_response.dart';
import 'base_model.dart';
import 'guide_data.dart';
import 'streams_data.dart';

@JsonSerializable()
class ChannelData extends BaseModel {
  const ChannelData({
    this.id,
    this.name,
    this.altNames = const [],
    this.network,
    this.owners = const [],
    this.country,
    this.subdivision,
    this.city,
    this.broadcastArea = const [],
    this.languages = const [],
    this.categories = const [],
    this.isNsfw,
    this.launched,
    this.closed,
    this.replacedBy,
    this.website,
    this.logo,
    this.streamsData,
    this.guideData,
  });

  final String? id;
  final String? name;
  final List<String> altNames;
  final String? network;
  final List<String> owners;
  final String? country;
  final String? subdivision;
  final String? city;
  final List<String> broadcastArea;
  final List<String> languages;
  final List<String> categories;
  final bool? isNsfw;
  final String? launched;
  final String? closed;
  final String? replacedBy;
  final String? website;
  final String? logo;
  final StreamsData? streamsData;
  final GuideData? guideData;

  factory ChannelData.fromJson(Map<String, dynamic> json) => _$ChannelDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ChannelDataToJson(this);

  factory ChannelData.fromChannelResponse(ChannelResponse data) {
    return ChannelData(
      id: data.id,
      name: data.name,
      altNames: data.altNames ?? [],
      network: data.network,
      owners: data.owners ?? [],
      country: data.country,
      subdivision: data.subdivision,
      city: data.city,
      broadcastArea: data.broadcastArea ?? [],
      languages: data.languages ?? [],
      categories: data.categories ?? [],
      isNsfw: data.isNsfw,
      launched: data.launched,
      closed: data.closed,
      replacedBy: data.replacedBy,
      website: data.website,
      logo: data.logo,
    );
  }

  ChannelData copyWith({
    String? id,
    String? name,
    List<String>? altNames,
    String? network,
    List<String>? owners,
    String? country,
    String? subdivision,
    String? city,
    List<String>? broadcastArea,
    List<String>? languages,
    List<String>? categories,
    bool? isNsfw,
    String? launched,
    String? closed,
    String? replacedBy,
    String? website,
    String? logo,
    StreamsData? streamData,
    GuideData? guideData,
  }) {
    return ChannelData(
      id: id ?? this.id,
      name: name ?? this.name,
      altNames: altNames ?? this.altNames,
      network: network ?? this.network,
      owners: owners ?? this.owners,
      country: country ?? this.country,
      subdivision: subdivision ?? this.subdivision,
      city: city ?? this.city,
      broadcastArea: broadcastArea ?? this.broadcastArea,
      languages: languages ?? this.languages,
      categories: categories ?? this.categories,
      isNsfw: isNsfw ?? this.isNsfw,
      launched: launched ?? this.launched,
      closed: closed ?? this.closed,
      replacedBy: replacedBy ?? this.replacedBy,
      website: website ?? this.website,
      logo: logo ?? this.logo,
      streamsData: streamData ?? this.streamsData,
      guideData: guideData ?? this.guideData,
    );
  }

  static ChannelData _$ChannelDataFromJson(Map<String, dynamic> json) => ChannelData(
        id: json['id'] as String?,
        name: json['name'] as String?,
        altNames: (json['altNames'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
        network: json['network'] as String?,
        owners: (json['owners'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
        country: json['country'] as String?,
        subdivision: json['subdivision'] as String?,
        city: json['city'] as String?,
        broadcastArea: (json['broadcastArea'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
        languages: (json['languages'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
        categories: (json['categories'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
        isNsfw: json['isNsfw'] as bool?,
        launched: json['launched'] as String?,
        closed: json['closed'] as String?,
        replacedBy: json['replacedBy'] as String?,
        website: json['website'] as String?,
        logo: json['logo'] as String?,
        streamsData:
            json['streamsData'] == null ? null : StreamsData.fromJson(json['streamsData'] as Map<String, dynamic>),
        guideData: json['guideData'] == null ? null : GuideData.fromJson(json['guideData'] as Map<String, dynamic>),
      );

  Map<String, dynamic> _$ChannelDataToJson(ChannelData instance) => <String, dynamic>{
        'id': instance.id,
        'name': instance.name,
        'altNames': instance.altNames,
        'network': instance.network,
        'owners': instance.owners,
        'country': instance.country,
        'subdivision': instance.subdivision,
        'city': instance.city,
        'broadcastArea': instance.broadcastArea,
        'languages': instance.languages,
        'categories': instance.categories,
        'isNsfw': instance.isNsfw,
        'launched': instance.launched,
        'closed': instance.closed,
        'replacedBy': instance.replacedBy,
        'website': instance.website,
        'logo': instance.logo,
        'streamsData': instance.streamsData?.toJson(),
        'guideData': instance.guideData?.toJson(),
      };
}
