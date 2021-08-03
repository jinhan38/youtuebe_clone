import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:youtube_clone/src/pages/Explore.dart';
import 'package:youtube_clone/src/pages/Library.dart';
import 'package:youtube_clone/src/pages/Subscribe.dart';

import 'controller/app_controller.dart';
import 'pages/Home.dart';

class App extends GetView<AppController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {

        switch(RouteName.values[controller.currentIndex.value]){
          case RouteName.Home :
            return Home();
          case RouteName.Explore:
            return Explore();
          case RouteName.Add:
            break;
          case RouteName.Subscribe:
            return Subscribe();
          case RouteName.Library:
            return Library();
        }
        return Container();
      }),
      //BottomNavigationBarType.fixed 바텀내비 클릭했을 때 애니메이션 효과 없앰
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          //changePageIndex는 함수며 인자값으로 int를 받는데
          //이렇게 선언하면 onTap에 있는 index가 자동으로 들어간다
          onTap: controller.changePageIndex,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/icons/home_off.svg"),
                activeIcon: SvgPicture.asset("assets/svg/icons/home_on.svg"),
                label: "홈"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/icons/compass_off.svg",
                    width: 22),
                activeIcon: SvgPicture.asset(
                  "assets/svg/icons/compass_on.svg",
                  width: 22,
                ),
                label: "탐색"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/svg/icons/plus.svg",
                  width: 35,
                ),
                label: ""),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/icons/subs_off.svg"),
              activeIcon: SvgPicture.asset("assets/svg/icons/subs_on.svg"),
              label: "구독",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/icons/library_off.svg"),
              activeIcon: SvgPicture.asset("assets/svg/icons/library_on.svg"),
              label: "보관함",
            ),
          ],
        ),
      ),
    );
  }
}
