import 'package:json_annotation/json_annotation.dart';

import '../network/response/language_response.dart';
import 'base_model.dart';

part 'language_data.g.dart';

@JsonSerializable()
class LanguageData extends BaseModel {
  const LanguageData({
    this.name,
    this.code,
  });

  final String? name;
  final String? code;

  factory LanguageData.fromJson(Map<String, dynamic> json) => _$LanguageDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LanguageDataToJson(this);

  factory LanguageData.fromLanguageResponse(LanguageResponse data) {
    return LanguageData(
      name: data.name,
      code: data.code,
    );
  }
}
