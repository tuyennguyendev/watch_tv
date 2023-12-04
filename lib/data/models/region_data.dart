import 'package:watch_tv/data/network/response/region_response.dart';

class RegionData {
  const RegionData({
    this.code,
    this.name,
    this.countries = const [],
  });

  final String? code;
  final String? name;
  final List<String> countries;

  factory RegionData.fromRegionResponse(RegionResponse data) {
    return RegionData(
      code: data.code,
      name: data.name,
      countries: data.countries ?? []
    );
  }
}
