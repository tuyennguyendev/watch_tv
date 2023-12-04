import 'package:watch_tv/config/injection.dart';
import 'package:watch_tv/data/models/category_data.dart';
import 'package:watch_tv/data/models/channel_data.dart';
import 'package:watch_tv/data/models/country_data.dart';
import 'package:watch_tv/data/models/guide_data.dart';
import 'package:watch_tv/data/models/language_data.dart';
import 'package:watch_tv/data/models/region_data.dart';
import 'package:watch_tv/data/models/subdivision_data.dart';
import 'package:watch_tv/data/network/app_api.dart';
import 'package:watch_tv/data/network/response/category_response.dart';
import 'package:watch_tv/data/network/response/country_response.dart';
import 'package:watch_tv/data/network/response/guide_response.dart';
import 'package:watch_tv/data/network/response/language_response.dart';
import 'package:watch_tv/data/network/response/region_response.dart';
import 'package:watch_tv/data/network/response/stream_response.dart';
import 'package:watch_tv/data/network/response/subdivision_response.dart';

import '../models/stream_data.dart';
import '../network/response/channel_response.dart';

class IptvSourceRepo {
  final AppApi _appApi = getIt<AppApi>();

  Future<List<ChannelData>> getListChannel() async {
    final List<ChannelResponse> response = await _appApi.getListChannel();
    return response.map((channel) => ChannelData.fromChannelResponse(channel)).toList();
  }

  Future<List<StreamData>> getListStream() async {
    final List<StreamResponse> response = await _appApi.getListStream();
    return response.map((stream) => StreamData.fromStreamResponse(stream)).toList();
  }

  Future<List<GuideData>> getListGuide() async {
    final List<GuideResponse> response = await _appApi.getListGuide();
    return response.map((guide) => GuideData.fromGuideResponse(guide)).toList();
  }

  Future<List<CategoryData>> getListCategory() async {
    final List<CategoryResponse> response = await _appApi.getListCategory();
    return response.map((category) => CategoryData.fromCategoryResponse(category)).toList();
  }

  Future<List<LanguageData>> getListLanguage() async {
    final List<LanguageResponse> response = await _appApi.getListLanguage();
    return response.map((language) => LanguageData.fromLanguageResponse(language)).toList();
  }

  Future<List<CountryData>> getListCountry() async {
    final List<CountryResponse> response = await _appApi.getListCountry();
    return response.map((country) => CountryData.fromCountryResponse(country)).toList();
  }

  Future<List<SubdivisionData>> getListSubdivision() async {
    final List<SubdivisionResponse> response = await _appApi.getListSubdivision();
    return response.map((subdivision) => SubdivisionData.fromSubdivisionResponse(subdivision)).toList();
  }

  Future<List<RegionData>> getListRegion() async {
    final List<RegionResponse> response = await _appApi.getListRegion();
    return response.map((region) => RegionData.fromRegionResponse(region)).toList();
  }
}
