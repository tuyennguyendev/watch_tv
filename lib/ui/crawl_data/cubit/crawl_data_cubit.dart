import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_tv/config/injection.dart';
import 'package:watch_tv/data/models/category_data.dart';
import 'package:watch_tv/data/models/channel_data.dart';
import 'package:watch_tv/data/models/country_data.dart';
import 'package:watch_tv/data/models/guide_data.dart';
import 'package:watch_tv/data/models/language_data.dart';
import 'package:watch_tv/data/models/region_data.dart';
import 'package:watch_tv/data/models/streams_data.dart';
import 'package:watch_tv/data/models/subdivision_data.dart';
import 'package:watch_tv/data/repository/iptv_source_repo.dart';

part 'crawl_data_state.dart';

class CrawlDataCubit extends Cubit<CrawlDataState> {
  CrawlDataCubit() : super(const CrawlDataInitial());

  final IptvSourceRepo _iptvSourceRepo = getIt<IptvSourceRepo>();
  final List<ChannelData> channels = [];
  final List<StreamsData> streams = [];
  final List<GuideData> guides = [];
  final List<CategoryData> categories = [];
  final List<LanguageData> languages = [];
  final List<CountryData> countries = [];
  final List<SubdivisionData> subdivisions = [];
  final List<RegionData> regions = [];

  Future<void> getChannelList() async {
    emit(const CrawlDataLoading());

    await Future.wait([
      _getChannelList(),
      _getListStream(),
      _getListGuide(),
      _getListCategory(),
      _getListLanguage(),
      _getListCountry(),
      _getListSubdivision(),
      _getListRegion(),
    ]);

    for (int index = 0; index < channels.length; index++) {
      final ChannelData channel = channels[index];
      final StreamsData? streamData = streams.firstWhereOrNull((e) => e.channel == channel.id);
      final GuideData? guideData = guides.firstWhereOrNull((element) => element.channel == channel.id);

      channels[index] = channels[index].copyWith(
        streamData: streamData,
        guideData: guideData,
      );
    }

    channels.removeWhere((channel) {
      if (channel.streamsData?.hasValidUrl != true) return true;
      return false;
    });
    await _saveChannel(channels.first);
    for (final channel in channels) {
      await _saveChannel(channel);
    }

    emit(const CrawlDataSuccess());
  }

  Future<void> _getChannelList() async {
    final result = await _iptvSourceRepo.getListChannel();
    result.when(success: (data) async {
      channels.clear();
      channels.addAll(data.map((channel) => ChannelData.fromChannelResponse(channel)).toList());
    }, failure: (error) {
      emit(CrawlDataFailed(error.errorMessage));
    });
  }

  Future<void> _getListStream() async {
    final result = await _iptvSourceRepo.getListStream();
    result.when(success: (data) async {
      streams.clear();
      streams.addAll(data.map((stream) => StreamsData.fromStreamResponse(stream)).toList());
    }, failure: (error) {
      emit(CrawlDataFailed(error.errorMessage));
    });
  }

  Future<void> _getListGuide() async {
    final result = await _iptvSourceRepo.getListGuide();
    result.when(success: (data) async {
      guides.clear();
      guides.addAll(data.map((guide) => GuideData.fromGuideResponse(guide)).toList());
    }, failure: (error) {
      emit(CrawlDataFailed(error.errorMessage));
    });
  }

  Future<void> _getListCategory() async {
    final result = await _iptvSourceRepo.getListCategory();
    result.when(success: (data) async {
      categories.clear();
      categories.addAll(data.map((category) => CategoryData.fromCategoryResponse(category)).toList());
    }, failure: (error) {
      emit(CrawlDataFailed(error.errorMessage));
    });
  }

  Future<void> _getListLanguage() async {
    final result = await _iptvSourceRepo.getListLanguage();
    result.when(success: (data) async {
      languages.clear();
      languages.addAll(data.map((language) => LanguageData.fromLanguageResponse(language)).toList());
    }, failure: (error) {
      emit(CrawlDataFailed(error.errorMessage));
    });
  }

  Future<void> _getListCountry() async {
    final result = await _iptvSourceRepo.getListCountry();
    result.when(success: (data) async {
      countries.clear();
      countries.addAll(data.map((countries) => CountryData.fromCountryResponse(countries)).toList());
    }, failure: (error) {
      emit(CrawlDataFailed(error.errorMessage));
    });
  }

  Future<void> _getListSubdivision() async {
    final result = await _iptvSourceRepo.getListSubdivision();
    result.when(success: (data) async {
      subdivisions.clear();
      subdivisions.addAll(data.map((subdivision) => SubdivisionData.fromSubdivisionResponse(subdivision)).toList());
    }, failure: (error) {
      emit(CrawlDataFailed(error.errorMessage));
    });
  }

  Future<void> _getListRegion() async {
    final result = await _iptvSourceRepo.getListRegion();
    result.when(success: (data) async {
      regions.clear();
      regions.addAll(data.map((region) => RegionData.fromRegionResponse(region)).toList());
    }, failure: (error) {
      emit(CrawlDataFailed(error.errorMessage));
    });
  }

  Future<void> _saveChannel(ChannelData channel) async {
    final result = await _iptvSourceRepo.saveChannels(channel);
    result.when(success: (_) async {
      emit(const CrawlDataSuccess());
    }, failure: (error) {
      emit(CrawlDataFailed(error.errorMessage));
    });
  }
}
