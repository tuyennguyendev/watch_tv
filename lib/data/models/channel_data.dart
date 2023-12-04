import 'package:watch_tv/data/network/response/channel_response.dart';

import 'category_data.dart';
import 'country_data.dart';
import 'guide_data.dart';
import 'language_data.dart';
import 'region_data.dart';
import 'stream_data.dart';
import 'subdivision_data.dart';

class ChannelData {
  const ChannelData({
    this.id,
    this.name,
    this.altNames = const [],
    this.network,
    this.owners = const [],
    this.country,
    this.subdivision,
    this.city,
    this.broadcastArea = const [],
    this.languages = const [],
    this.categories = const [],
    this.isNsfw,
    this.launched,
    this.closed,
    this.replacedBy,
    this.website,
    this.logo,
    this.streamData,
    this.guideData,
    this.categoryData,
    this.languageData,
    this.countryData,
    this.subdivisionData,
    this.regionData,
  });

  final String? id;
  final String? name;
  final List<String> altNames;
  final String? network;
  final List<String> owners;
  final String? country;
  final String? subdivision;
  final String? city;
  final List<String> broadcastArea;
  final List<String> languages;
  final List<String> categories;
  final bool? isNsfw;
  final String? launched;
  final String? closed;
  final String? replacedBy;
  final String? website;
  final String? logo;
  final StreamData? streamData;
  final GuideData? guideData;
  final CategoryData? categoryData;
  final LanguageData? languageData;
  final CountryData? countryData;
  final SubdivisionData? subdivisionData;
  final RegionData? regionData;

  factory ChannelData.fromChannelResponse(ChannelResponse data) {
    return ChannelData(
      id: data.id,
      name: data.name,
      altNames: data.altNames ?? [],
      network: data.network,
      owners: data.owners ?? [],
      country: data.country,
      subdivision: data.subdivision,
      city: data.city,
      broadcastArea: data.broadcastArea ?? [],
      languages: data.languages ?? [],
      categories: data.categories ?? [],
      isNsfw: data.isNsfw,
      launched: data.launched,
      closed: data.closed,
      replacedBy: data.replacedBy,
      website: data.website,
      logo: data.logo,
    );
  }

  ChannelData copyWith({
    String? id,
    String? name,
    List<String>? altNames,
    String? network,
    List<String>? owners,
    String? country,
    String? subdivision,
    String? city,
    List<String>? broadcastArea,
    List<String>? languages,
    List<String>? categories,
    bool? isNsfw,
    String? launched,
    String? closed,
    String? replacedBy,
    String? website,
    String? logo,
    StreamData? streamData,
    GuideData? guideData,
    CategoryData? categoryData,
    LanguageData? languageData,
    CountryData? countryData,
    SubdivisionData? subdivisionData,
    RegionData? regionData,
  }) {
    return ChannelData(
      id: id ?? this.id,
      name: name ?? this.name,
      altNames: altNames ?? this.altNames,
      network: network ?? this.network,
      owners: owners ?? this.owners,
      country: country ?? this.country,
      subdivision: subdivision ?? this.subdivision,
      city: city ?? this.city,
      broadcastArea: broadcastArea ?? this.broadcastArea,
      languages: languages ?? this.languages,
      categories: categories ?? this.categories,
      isNsfw: isNsfw ?? this.isNsfw,
      launched: launched ?? this.launched,
      closed: closed ?? this.closed,
      replacedBy: replacedBy ?? this.replacedBy,
      website: website ?? this.website,
      logo: logo ?? this.logo,
      streamData: streamData ?? this.streamData,
      guideData: guideData ?? this.guideData,
      categoryData: categoryData ?? this.categoryData,
      languageData: languageData ?? this.languageData,
      countryData: countryData ?? this.countryData,
      subdivisionData: subdivisionData ?? this.subdivisionData,
      regionData: regionData ?? this.regionData,
    );
  }
}
