import 'package:json_annotation/json_annotation.dart';
import '../network/response/guide_response.dart';

import 'base_model.dart';

part 'guide_data.g.dart';

@JsonSerializable()
class GuideData extends BaseModel {
  const GuideData({
    this.channel,
    this.site,
    this.siteId,
    this.siteName,
    this.lang,
  });

  final String? channel;
  final String? site;
  final String? siteId;
  final String? siteName;
  final String? lang;

  factory GuideData.fromJson(Map<String, dynamic> json) => _$GuideDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GuideDataToJson(this);

  factory GuideData.fromGuideResponse(GuideResponse data) {
    return GuideData(
      channel: data.channel,
      site: data.site,
      siteId: data.siteId,
      siteName: data.siteName,
      lang: data.lang,
    );
  }
}
