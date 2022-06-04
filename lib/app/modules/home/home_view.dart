import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bar1/screens/search_screen.dart';
import '../bar2/screens/screen.dart';
import 'controller/home_controller.dart';
import 'screens/home_screen.dart';
import '../profile/profile_screen.dart';
import '../../../constant.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController(), permanent: true);

  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    AddnovelScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return _widgetOptions.elementAt(controller.currPage.value);
      }),
      bottomNavigationBar: Obx(() {
        return SalomonBottomBar(
          currentIndex: controller.currPage.value,
          onTap: (i) {
            controller.changeTab(i);
          },
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home_rounded),
              title: const Text(
                "Home",
              ),
              selectedColor: kMainColor,
            ),

            //Search screen
            SalomonBottomBarItem(
              icon: const Icon(Icons.home_rounded),
              title: const Text("Tab1"),
              selectedColor: kMainColor,
            ),
            //  Zohiol bichih heseg
            SalomonBottomBarItem(
              icon: const Icon(Icons.home_rounded),
              title: const Text("Tab2"),
              selectedColor: kMainColor,
            ),
            //profile screen
            SalomonBottomBarItem(
              icon: const Icon(Icons.person_outline_rounded),
              title: const Text("profile"),
              selectedColor: kMainColor,
            ),
          ],
        );
      }),
    );
  }
}
