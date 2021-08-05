import 'package:youtube_clone/src/models/video.dart';

class YoutubeVideoResult {
  int? totalResults = 0;
  int? resultPerPage = 0;
  String? nextPageToken = "";
  List<Video>? videoList = [];

  YoutubeVideoResult(
      {this.totalResults,
      this.resultPerPage,
      this.nextPageToken,
      this.videoList});


  factory YoutubeVideoResult.fromJson(Map<String, dynamic> json) =>
      YoutubeVideoResult(
           totalResults: json["pageInfo"]["totalResults"] ,
          resultPerPage: json["pageInfo"]["resultPerPage"],
          nextPageToken: json["nextPageToken"],
          videoList: List<Video>.from(json["items"].map((data) => Video.fromJson(data))));
}
