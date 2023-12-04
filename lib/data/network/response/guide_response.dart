import 'package:json_annotation/json_annotation.dart';

part 'guide_response.g.dart';

@JsonSerializable()
class GuideResponse {
  final String? channel;
  final String? site;
  @JsonKey(name: 'site_id')
  final String? siteId;
  @JsonKey(name: 'site_name')
  final String? siteName;
  final String? lang;

  const GuideResponse({
    this.channel,
    this.site,
    this.siteId,
    this.siteName,
    this.lang,
  });

  factory GuideResponse.fromJson(Map<String, dynamic> json) => _$GuideResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GuideResponseToJson(this);
}
