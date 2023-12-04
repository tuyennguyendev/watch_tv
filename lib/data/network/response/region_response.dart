import 'package:json_annotation/json_annotation.dart';

part 'region_response.g.dart';

@JsonSerializable()
class RegionResponse {
  final String? code;
  final String? name;
  final List<String>? countries;

  const RegionResponse({
    this.name,
    this.code,
    this.countries,
  });

  factory RegionResponse.fromJson(Map<String, dynamic> json) => _$RegionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegionResponseToJson(this);
}
