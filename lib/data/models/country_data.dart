import 'package:json_annotation/json_annotation.dart';

import '../network/response/country_response.dart';
import 'base_model.dart';

part 'country_data.g.dart';

@JsonSerializable()
class CountryData extends BaseModel {
  const CountryData({
    this.name,
    this.code,
    this.languages = const [],
    this.flag,
  });

  final String? name;
  final String? code;
  final List<String> languages;
  final String? flag;

  factory CountryData.fromJson(Map<String, dynamic> json) => _$CountryDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CountryDataToJson(this);

  factory CountryData.fromCountryResponse(CountryResponse data) {
    return CountryData(
      name: data.name,
      code: data.code,
      languages: data.languages ?? [],
      flag: data.flag,
    );
  }
}
