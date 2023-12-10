import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:watch_tv/config/injection.dart';
import 'package:watch_tv/data/network/app_api.dart';
import 'package:watch_tv/data/network/helper/base_repository.dart';
import 'package:watch_tv/data/network/response/category_response.dart';
import 'package:watch_tv/data/network/response/country_response.dart';
import 'package:watch_tv/data/network/response/guide_response.dart';
import 'package:watch_tv/data/network/response/language_response.dart';
import 'package:watch_tv/data/network/response/region_response.dart';
import 'package:watch_tv/data/network/response/stream_response.dart';
import 'package:watch_tv/data/network/response/subdivision_response.dart';

import '../models/channel_data.dart';
import '../network/helper/api_result.dart';
import '../network/response/channel_response.dart';

class IptvSourceRepo extends BaseRepository {
  final AppApi _appApi = getIt<AppApi>();
  final CollectionReference _databaseReference = FirebaseFirestore.instance.collection('channels');

  Future<ApiResult<List<ChannelResponse>>> getListChannel() async {
    return safeCallApi(_appApi.getListChannel());
  }

  Future<ApiResult<List<StreamResponse>>> getListStream() async {
    return safeCallApi(_appApi.getListStream());
  }

  Future<ApiResult<List<GuideResponse>>> getListGuide() async {
    return safeCallApi(_appApi.getListGuide());
  }

  Future<ApiResult<List<CategoryResponse>>> getListCategory() async {
    return safeCallApi(_appApi.getListCategory());
  }

  Future<ApiResult<List<LanguageResponse>>> getListLanguage() async {
    return safeCallApi(_appApi.getListLanguage());
  }

  Future<ApiResult<List<CountryResponse>>> getListCountry() async {
    return safeCallApi(_appApi.getListCountry());
  }

  Future<ApiResult<List<SubdivisionResponse>>> getListSubdivision() async {
    return safeCallApi(_appApi.getListSubdivision());
  }

  Future<ApiResult<List<RegionResponse>>> getListRegion() async {
    return safeCallApi(_appApi.getListRegion());
  }

  Future<ApiResult<void>> saveChannels(ChannelData channel) async {
    return safeCallApi(_databaseReference.add(channel.toJson()));
  }
}
