import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/src/controller/video_controller.dart';
import 'package:youtube_clone/src/models/statistics.dart';
import 'package:youtube_clone/src/models/video.dart';
import 'package:intl/intl.dart';

class VideoWidget extends StatefulWidget {
  VideoWidget({required this.video});

  late final Video video;
  late final Statistics statistics;

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoController _videoController;

  @override
  void initState() {
    _videoController = Get.put(VideoController(video: widget.video),
        tag: widget.video.id.videoId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _thumbnail(),
          _simpleDetailInfo(),
        ],
      ),
    );
  }

  Widget _thumbnail() {
    return Container(
      height: 250,
      width: double.infinity,
      color: Colors.grey.withOpacity(0.5),
      child: Image.network(
        widget.video.snippet.thumbnails.high.url,
        fit: BoxFit.fitWidth,
        // height: double.infinity,
      ),
    );
  }

  Widget _simpleDetailInfo() {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 20),
      child: Row(
        children: [
          Obx(
            () => CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue.withOpacity(0.1),
              backgroundImage: Image.network(
                  _videoController.youtuberThumbnailUrl)
                  .image,
              // backgroundImage: Image.network(
              //         "https://img.icons8.com/material-sharp/452/flutter.png")
              //     .image,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //줄바꿈 처리 위해서는 Expanded를 설정해줘야 한다. 그래야 영역이 잡히기 때문이다.
                    Expanded(
                        child: Text(
                      widget.video.snippet.title.toString(),
                      maxLines: 2,
                    )),
                    IconButton(
                        alignment: Alignment.topCenter,
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert,
                          size: 18,
                        ))
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "밈PD",
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.8)),
                    ),
                    Obx(
                      () => Text(
                        "${_videoController.viewCountString} · ${DateFormat("yyyy-MM-dd").format(widget.video.snippet.publishedAt)}",
                        style: TextStyle(
                            fontSize: 12, color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
