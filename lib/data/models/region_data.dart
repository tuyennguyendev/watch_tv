import 'package:json_annotation/json_annotation.dart';
import '../network/response/region_response.dart';

import 'base_model.dart';

part 'region_data.g.dart';

@JsonSerializable()
class RegionData extends BaseModel {
  const RegionData({
    this.code,
    this.name,
    this.countries = const [],
  });

  final String? code;
  final String? name;
  final List<String> countries;

  factory RegionData.fromJson(Map<String, dynamic> json) => _$RegionDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RegionDataToJson(this);

  factory RegionData.fromRegionResponse(RegionResponse data) {
    return RegionData(
      code: data.code,
      name: data.name,
      countries: data.countries ?? [],
    );
  }
}
