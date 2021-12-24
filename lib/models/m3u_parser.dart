// import 'dart:io';
// import 'package:path/path.dart' as p;
import 'package:watch_tv/models/m3u8.dart';

class M3UParser {
  M3UParser(String rawText) {
    _parseRawText(rawText);
  }

  // factory M3UParser.fromPath(String path) {
  //   return M3UParser(File(path));
  // }

  // factory M3UParser.fromRawText(String rawText) {

  // }

  // factory M3UParser.fromFile(final File file) {
  //   return M3UParser();
  //   _parseFile(file);
  // }

  // void _parseFile(File file) {
  //   final String extension = p.extension(file.path);
  //   if (extension != '.m3u') return;
  //   file.readAsLines().then((contents) {
  //     _getHeader(contents);
  //     _parseM3U8(contents);
  //   });
  // }

  late final String header;
  final List<M3U8> data = [];

  void _parseRawText(String rawText) {
    final List<String> lines = rawText.split('\n');
    _getHeader(lines);
    _parseM3U8(lines);
  }

  void _getHeader(List<String> sourse) {
    for (final line in sourse) {
      if (line.startsWith('#EXTM3U')) {
        header = line;
      }
    }
  }

  void _parseM3U8(List<String> sourse) {
    int current = sourse.indexWhere((line) => line.startsWith('#EXTINF'), 1);
    int next = sourse.indexWhere((line) => line.startsWith('#EXTINF'), current + 1);

    while (next != -1) {
      data.add(M3U8.fromRawText(rawText: sourse.sublist(current, next)));
      current = sourse.indexWhere((String line) => line.startsWith('#EXTINF'), next);
      next = sourse.indexWhere((String line) => line.startsWith('#EXTINF'), current + 1);
    }
  }
}
