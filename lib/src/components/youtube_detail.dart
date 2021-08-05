import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class YoutubeDetail extends StatelessWidget {
  const YoutubeDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("상세화면")),
      body: Column(
        children: [
          Container(height: 250, color: Colors.grey.withOpacity(0.5)),
          Expanded(child: _description())
        ],
      ),
    );
  }

  Widget _description() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _titleZone(),
          line,
          _descriptionZone(),
          _bottomZone(),
          line,
          _ownerZone()
        ],
      ),
    );
  }

  Widget get line => Container(height: 1, color: Colors.black.withOpacity(0.1));

  Widget _titleZone() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "flutter youtube coding",
            style: TextStyle(fontSize: 15),
          ),
          Row(
            children: [
              Text(
                "조회수 500회",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Text(" · "),
              Text(
                "2021-08-05",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _descriptionZone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Text(
        "flutter example by jinhan",
        style: TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _bottomZone() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buttonOne("like", "846"),
          _buttonOne("dislike", "46"),
          _buttonOne("share", "공유"),
          _buttonOne("save", "저장"),
        ],
      ),
    );
  }

  Widget _buttonOne(String iconPath, String text) {
    return Column(
      children: [
        SvgPicture.asset("assets/svg/icons/$iconPath.svg"),
        Text(text),
      ],
    );
  }

  Widget _ownerZone() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.withOpacity(0.1),
            backgroundImage: Image.network(
                    "https://img.icons8.com/material-sharp/452/flutter.png")
                .image,
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("flutter with jinhan", style: TextStyle(fontSize: 18)),
                Text("구독자 1,840,722",
                    style: TextStyle(
                        fontSize: 18, color: Colors.black.withOpacity(0.6))),
              ],
            ),
          ),
          TextButton(
              onPressed: () {
                print("프린트 구독");
              },
              child: Text("구독",
                  style: TextStyle(color: Colors.red, fontSize: 16))),
        ],
      ),
    );
  }
}
