import 'package:watch_tv/data/network/response/guide_response.dart';

class GuideData {
  const GuideData({
    this.channel,
    this.site,
    this.siteId,
    this.siteName,
    this.lang,
  });

  final String? channel;
  final String? site;
  final String? siteId;
  final String? siteName;
  final String? lang;

  factory GuideData.fromGuideResponse(GuideResponse data) {
    return GuideData(
      channel: data.channel,
      site: data.site,
      siteId: data.siteId,
      siteName: data.siteName,
      lang: data.lang,
    );
  }
}
