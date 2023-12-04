import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:watch_tv/data/network/response/country_response.dart';
import 'package:watch_tv/data/network/response/language_response.dart';
import 'package:watch_tv/data/network/response/region_response.dart';
import 'package:watch_tv/data/network/response/subdivision_response.dart';

import 'request/login_request.dart';
import 'response/category_response.dart';
import 'response/channel_response.dart';
import 'response/guide_response.dart';
import 'response/stream_response.dart';
import 'response/user_detail_response.dart';

part 'app_api.g.dart';

@RestApi()
abstract class AppApi {
  factory AppApi(Dio dio, {String baseUrl}) = _AppApi;

  @POST('/login')
  Future<UserDetailResponse> loginWithNameAndPassword(@Body() LoginRequest loginEmailParam);

  @GET('/channels.json')
  Future<List<ChannelResponse>> getListChannel();

  @GET('/streams.json')
  Future<List<StreamResponse>> getListStream();

  @GET('/guides.json')
  Future<List<GuideResponse>> getListGuide();

  @GET('/categories.json')
  Future<List<CategoryResponse>> getListCategory();

  @GET('/languages.json')
  Future<List<LanguageResponse>> getListLanguage();

  @GET('/countries.json')
  Future<List<CountryResponse>> getListCountry();

  @GET('/subdivisions.json')
  Future<List<SubdivisionResponse>> getListSubdivision();

  @GET('/regions.json')
  Future<List<RegionResponse>> getListRegion();
}
