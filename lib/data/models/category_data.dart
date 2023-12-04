import 'package:watch_tv/data/network/response/category_response.dart';

class CategoryData {
  const CategoryData({
    this.id,
    this.name,
  });

  final String? id;
  final String? name;

  factory CategoryData.fromCategoryResponse(CategoryResponse data) {
    return CategoryData(
      id: data.id,
      name: data.name,
    );
  }
}
