import 'package:json_annotation/json_annotation.dart';

import '../network/response/subdivision_response.dart';
import 'base_model.dart';

part 'subdivision_data.g.dart';

@JsonSerializable()
class SubdivisionData extends BaseModel {
  const SubdivisionData({
    this.country,
    this.name,
    this.code,
  });

  final String? country;
  final String? name;
  final String? code;

  factory SubdivisionData.fromJson(Map<String, dynamic> json) => _$SubdivisionDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SubdivisionDataToJson(this);

  factory SubdivisionData.fromSubdivisionResponse(SubdivisionResponse data) {
    return SubdivisionData(
      country: data.country,
      name: data.name,
      code: data.code,
    );
  }
}
