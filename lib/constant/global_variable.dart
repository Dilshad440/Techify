import 'package:flutter/material.dart';
import 'package:techify_assesment/constant/image_const.dart';
import 'package:techify_assesment/ui/bookmark_screen.dart';
import 'package:techify_assesment/ui/home_screen.dart';
import 'package:techify_assesment/ui/setting_screen.dart';

class GlobalVariable {
  static const List<String> tabTexts = ['All News', 'Business', "Politics", "Tech", "Science"];
  static const List<IconData> bottomNavigationBarImage = [
    Icons.home,
    Icons.search,
    Icons.bookmark,
    Icons.settings
  ];

  static bottomBarScreen() {
    return [
      const HomeScreen(),
      const Center(child: Text("Search Screen ")),
      BookmarkScreen(),
      const SettingScreen(),
    ];
  }

  static const sliderImages = [
    ImageConst.firstImage,
    ImageConst.secondImage,
    ImageConst.thirdImage,
    ImageConst.fourthImage,
    ImageConst.fifthImage,
  ];
}
