// import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:youtube_clone/src/models/youtube_video_result.dart';

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
    return YoutubeVideoResult.fromJson(response.body);
    // if (response.status.hasError) {
    //   return Future.error(response.statusText.toString());
    // } else {
    //   if (response.body["items"] != null && response.body["items"].legnth > 0) {
    //     return YoutubeVideoResult.fromJson(response.body);
    //   }
    // }
  }
}
