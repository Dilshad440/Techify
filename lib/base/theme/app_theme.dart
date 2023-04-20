import 'package:flutter/material.dart';
import 'package:techify_assesment/constant/color_constant.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      primarySwatch: Colors.red,
      canvasColor: ColorConst.lightWhite,
      tabBarTheme: const TabBarTheme(
        indicatorColor: ColorConst.tabColor,
        unselectedLabelColor: Colors.grey,
        labelColor: ColorConst.tabColor,
      ),
      appBarTheme: const AppBarTheme(
        toolbarTextStyle: TextStyle(
          color: ColorConst.black,
          fontSize: 22,
        ),
        backgroundColor: ColorConst.scaffoldColor,
      ),
      scaffoldBackgroundColor: ColorConst.scaffoldColor,
    );
  }
}
