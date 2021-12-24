class M3U8 {
  M3U8({
    required this.tvgId,
    required this.tvgLogo,
    required this.name,
    required this.url,
    this.groupTitle,
    this.tvgChno,
    this.catchup,
    this.backupUrls,
  });

  factory M3U8.fromRawText({
    required List<String> rawText,
  }) {
    String _getTagValue(String source, String tag) {
      int start = source.indexOf(tag);
      if (start == -1) return '';
      start += tag.length + 2;
      final int end = source.indexOf('"', start);
      if (start == -1 || end == -1) return '';
      return source.substring(start, end);
    }

    String _getChannelName(String source) {
      final int start = source.lastIndexOf(',');
      if (start == -1) return '';
      return source.substring(start).trim();
    }

    List<String> _getListUrl(List<String> sourceList) {
      final List<String> urls = [];
      for (final line in sourceList) {
        if (line.startsWith("#http")) {
          urls.add(line.substring(1).trim());
        } else if (line.startsWith("http")) {
          urls.add(line.trim());
        }
      }
      return urls;
    }

    final String info =
        rawText.firstWhere((element) => element.startsWith('#EXTINF:'), orElse: () => '');
    final List<String> urls = _getListUrl(rawText);
    final String catchupDays = _getTagValue(info, 'catchup-days');
    final String catchupSource = _getTagValue(info, 'catchup-source');
    final Catchup? catchup = catchupDays.isEmpty || catchupSource.isEmpty
        ? null
        : Catchup(
            catchupDays: double.parse(catchupDays),
            catchupSource: catchupSource,
          );

    return M3U8(
      tvgId: _getTagValue(info, "tvg-id"),
      tvgLogo: _getTagValue(info, "tvg-logo"),
      name: _getChannelName(info),
      url: urls.first,
      groupTitle: _getTagValue(info, "group-title"),
      tvgChno: _getTagValue(info, "tvg-chno"),
      catchup: catchup,
      backupUrls: urls.sublist(1),
    );
  }

  final String tvgId;
  final String tvgLogo;
  final String name;
  final String url;
  final String? groupTitle;
  final String? tvgChno;
  final Catchup? catchup;
  final List<String>? backupUrls;
}

class Catchup {
  Catchup({
    required this.catchupDays,
    required this.catchupSource,
  });
  final double? catchupDays;
  final String? catchupSource;
}
