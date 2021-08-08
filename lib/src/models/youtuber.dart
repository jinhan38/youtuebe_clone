import 'package:youtube_clone/src/models/statistics.dart';
import 'package:youtube_clone/src/models/video.dart';

class Youtuber {
  Youtuber({required this.snippet, required this.statistics});

  // Youtuber({Snippet snippet, Statistics? statistics}) {
  //   this.snippet = snippet!;
  //   this.statistics = statistics!;
  // }

  Snippet snippet ;

  Statistics statistics ;

  factory Youtuber.fromJson(Map<String, dynamic> json) => Youtuber(
        snippet: Snippet.fromJson(json["snippet"]),
        statistics: Statistics.fromJson(json["statistics"]),
      );
}
