import 'package:watch_tv/data/network/response/language_response.dart';

class LanguageData {
  const LanguageData({
    this.name,
    this.code,
  });

  final String? name;
  final String? code;

  factory LanguageData.fromLanguageResponse(LanguageResponse data) {
    return LanguageData(
      name: data.name,
      code: data.code,
    );
  }
}
