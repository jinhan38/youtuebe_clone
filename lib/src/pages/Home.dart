import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/src/components/custom_appbar.dart';
import 'package:youtube_clone/src/components/video_widget.dart';
import 'package:youtube_clone/src/controller/home_controller.dart';

class Home extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => CustomScrollView(
          slivers: [
            SliverAppBar(
              title: CustomAppBar(),
              floating: true,
              snap: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GestureDetector(
                    child: VideoWidget(video : controller.youtubeResult.value.videoList![index]),
                    onTap: () {
                      Get.toNamed("/detail/239587");
                    },
                  );
                },
                childCount: controller.youtubeResult.value.videoList == null
                    ? 0
                    : controller.youtubeResult.value.videoList?.length,
                // childCount: controller.youtubeResult.value.videoList?.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
