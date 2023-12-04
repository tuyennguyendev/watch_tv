import 'package:watch_tv/data/network/response/subdivision_response.dart';

class SubdivisionData {
  const SubdivisionData({
    this.country,
    this.name,
    this.code,
  });

  final String? country;
  final String? name;
  final String? code;

  factory SubdivisionData.fromSubdivisionResponse(SubdivisionResponse data) {
    return SubdivisionData(
      country: data.country,
      name: data.name,
      code: data.code,
    );
  }
}
