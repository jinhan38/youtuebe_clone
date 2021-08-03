import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class YoutubeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        height: 200,
        color: Colors.white,
        child: Column(
          children: [
            header(),
            SizedBox(height: 10.0),
            _itemButton("upload.svg", 17.0, "동영상 업로드", () {
              print("동영상 업로드");
            }),
            SizedBox(height: 10.0),
            _itemButton("broadcast.svg", 25.0, "실시간 스트리밍 시작", () {
              print("실시간 스트리밍 시작");
            }),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "만들기",
          style: TextStyle(fontSize: 16),
        ),
        IconButton(
            onPressed: () {
              Get.back(); //바텀시트 닫을 때 Get.back하면 된다
            },
            icon: Icon(Icons.close))
      ],
    );
  }

  Widget _itemButton(
      String icon, double iconSize, String label, VoidCallback ontap) {
    return InkWell(
      onTap: ontap,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(shape: BoxShape.circle, color : Colors.grey.withOpacity(0.3)),
            //width/heigth 사이즈를 50을 줬다.
            // 이 사이즈 안에다가 Container의 이미지들을 알맞게 넣으려면
            //아래 Container를 Center로 감싸야 한다
            child: Center(
              child: Container(
                child: SvgPicture.asset(
                  "assets/svg/icons/$icon",
                  width: iconSize,
                  height: iconSize,
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          Text(label)
        ],
      ),
    );
  }
}
