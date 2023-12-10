import 'package:json_annotation/json_annotation.dart';
import '../network/response/category_response.dart';

import 'base_model.dart';

part 'category_data.g.dart';

@JsonSerializable()
class CategoryData extends BaseModel {
  const CategoryData({
    this.id,
    this.name,
  });

  final String? id;
  final String? name;

  factory CategoryData.fromJson(Map<String, dynamic> json) => _$CategoryDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);

  factory CategoryData.fromCategoryResponse(CategoryResponse data) {
    return CategoryData(
      id: data.id,
      name: data.name,
    );
  }
}
