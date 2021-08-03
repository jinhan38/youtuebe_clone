import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _logo(),
          _actions(),
        ],
      ),
    );
  }

  Widget _logo() {
    return Container(child: Text("Youtube"));
  }

  Widget _actions() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 23,
            height: 23,
            child: SvgPicture.asset("assets/svg/icons/bell.svg"),
          ),
        ),
        SizedBox(width: 15),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 30,
            height: 30,
            child: SvgPicture.asset("assets/svg/icons/search.svg"),
          ),
        ),
        SizedBox(width: 10),

        GestureDetector(
          onTap: () {},
          child: Container(
            width: 30,
            height: 30,
            child:  CircleAvatar(
              backgroundColor: Colors.blue.withOpacity(0.1),
              backgroundImage: Image.network(
                  "https://img.icons8.com/material-sharp/452/flutter.png")
                  .image,
            ),
          ),
        ),

      ],
    );
  }
}
