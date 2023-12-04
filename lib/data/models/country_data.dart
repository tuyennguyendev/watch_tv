import 'package:watch_tv/data/network/response/country_response.dart';

class CountryData {
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

  factory CountryData.fromCountryResponse(CountryResponse data) {
    return CountryData(
      name: data.name,
      code: data.code,
      languages: data.languages ?? [],
      flag: data.flag,
    );
  }
}
