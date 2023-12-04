import 'package:json_annotation/json_annotation.dart';

part 'country_response.g.dart';

@JsonSerializable()
class CountryResponse {
  final String? name;
  final String? code;
  final List<String>? languages;
  final String? flag;

  const CountryResponse({
    this.name,
    this.code,
    this.languages,
    this.flag,
  });

  factory CountryResponse.fromJson(Map<String, dynamic> json) => _$CountryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CountryResponseToJson(this);
}
