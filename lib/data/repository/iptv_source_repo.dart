import 'package:watch_tv/config/injection.dart';
import 'package:watch_tv/data/models/channel_data.dart';
import 'package:watch_tv/data/network/app_api.dart';
import 'package:watch_tv/data/network/helper/base_repository.dart';
import 'package:watch_tv/data/network/response/category_response.dart';
import 'package:watch_tv/data/network/response/country_response.dart';
import 'package:watch_tv/data/network/response/guide_response.dart';
import 'package:watch_tv/data/network/response/language_response.dart';
import 'package:watch_tv/data/network/response/region_response.dart';
import 'package:watch_tv/data/network/response/stream_response.dart';
import 'package:watch_tv/data/network/response/subdivision_response.dart';

import '../network/helper/api_result.dart';
import '../network/response/channel_response.dart';

class IptvSourceRepo extends BaseRepository {
  final AppApi _appApi = getIt<AppApi>();

  Future<List<ChannelData>> getListChannel() async {
    final List<ChannelResponse> response = await _appApi.getListChannel();
    return response.map((channel) => ChannelData.fromChannelResponse(channel)).toList();
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
}
