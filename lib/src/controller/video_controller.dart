import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/src/models/statistics.dart';
import 'package:youtube_clone/src/models/video.dart';
import 'package:youtube_clone/src/models/youtuber.dart';
import 'package:youtube_clone/src/repository/youtube_repository.dart';

class VideoController extends GetxController {
  VideoController({required this.video});

  final Video video;

  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber(
          statistics: Statistics(),
          snippet: Snippet(
              publishedAt: DateTime.now(),
              channelId: "",
              title: "",
              description: "",
              thumbnails: Thumbnails(
                  high: Default(),
                  medium: Default(),
                  thumbnailsDefault: Default()),
              channelTitle: "",
              liveBroadcastContent: ""))
      .obs;

  @override
  void onInit() async {
    Statistics loadStatistics =
        await YoutubeRepository.to.getVideoInfoById(video.id.videoId);
    statistics(loadStatistics);
    Youtuber loadYoutuber = await YoutubeRepository.to
        .getYoutuberInfoById(video.snippet.channelId.toString());
    youtuber(loadYoutuber);

    super.onInit();
  }

  String get viewCountString => " 조회수 ${statistics.value.viewCount}회";

  String get youtuberThumbnailUrl =>
      youtuber.value.snippet.thumbnails.medium.url.toString();
}
