import 'package:json_annotation/json_annotation.dart';

part 'subdivision_response.g.dart';

@JsonSerializable()
class SubdivisionResponse {
  final String? country;
  final String? name;
  final String? code;

  const SubdivisionResponse({
    this.country,
    this.name,
    this.code,
  });

  factory SubdivisionResponse.fromJson(Map<String, dynamic> json) => _$SubdivisionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubdivisionResponseToJson(this);
}
