import 'package:json_annotation/json_annotation.dart';

part 'channel_response.g.dart';

@JsonSerializable()
class ChannelResponse {
  final String? id;
  final String? name;
  @JsonKey(name: 'alt_names')
  final List<String>? altNames;
  final String? network;
  final List<String>? owners;
  final String? country;
  final String? subdivision;
  final String? city;
  @JsonKey(name: 'broadcast_area')
  final List<String>? broadcastArea;
  final List<String>? languages;
  final List<String>? categories;
  @JsonKey(name: 'is_nsfw')
  final bool? isNsfw;
  final String? launched;
  final String? closed;
  @JsonKey(name: 'replaced_by')
  final String? replacedBy;
  final String? website;
  final String? logo;

  const ChannelResponse({
    this.id,
    this.name,
    this.altNames,
    this.network,
    this.owners,
    this.country,
    this.subdivision,
    this.city,
    this.broadcastArea,
    this.languages,
    this.categories,
    this.isNsfw,
    this.launched,
    this.closed,
    this.replacedBy,
    this.website,
    this.logo,
  });

  factory ChannelResponse.fromJson(Map<String, dynamic> json) => _$ChannelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelResponseToJson(this);
}
