// import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:youtube_clone/src/models/statistics.dart';
import 'package:youtube_clone/src/models/video.dart';
import 'package:youtube_clone/src/models/youtube_video_result.dart';
import 'package:youtube_clone/src/models/youtuber.dart';

class YoutubeRepository extends GetConnect {
  static YoutubeRepository get to => Get.find();

  //여기서 api키와 헤더 등을 등록하면 된다.
  //https://github.com/jonataslaw/getx/blob/master/README.ko-kr.md
  @override
  void onInit() {
    httpClient.baseUrl = "https://www.googleapis.com";
    super.onInit();
  }

  Future<YoutubeVideoResult> loadVideo() async {
    String url =
        "/youtube/v3/search?part=snippet&channelId=UCqxW9ag8rCtIMfAHvOIEIQA&maxResults=20&order=date&type=video&videoDefinition=high&key=AIzaSyC2DYLXBqsm4U7H-Iu_wXV3mRUhL2Z2sAg";
    final response = await get(url);
    // return YoutubeVideoResult.fromJson(response.body);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["items"] != null) {
        return YoutubeVideoResult.fromJson(response.body);
      } else {
        return YoutubeVideoResult();
      }
    }
  }

  Future<Statistics> getVideoInfoById(String videoId) async {
    String url =
        "/youtube/v3/videos?part=statistics&key=AIzaSyC2DYLXBqsm4U7H-Iu_wXV3mRUhL2Z2sAg&id=$videoId";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["items"] != null) {
        Map<String, dynamic> data = response.body["items"][0];
        return Statistics.fromJson(data["statistics"]);
      } else {
        return Statistics();
      }
    }
  }

  Future<Youtuber> getYoutuberInfoById(String channelId) async {
    String url =
        "/youtube/v3/channels?part=statistics,snippet&key=AIzaSyC2DYLXBqsm4U7H-Iu_wXV3mRUhL2Z2sAg&id=$channelId";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      // if (response.body["items"] != null) {
      //   Map<String, dynamic> data = response.body["items"][0];
      //   return Youtuber.fromJson(data);
      // } else {
      //   return Youtuber();
      // }
      Map<String, dynamic> data = response.body["items"][0];
      return Youtuber.fromJson(data);
    }
  }



}
