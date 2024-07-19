import 'package:contact_app/controller/config/config.dart';
import 'package:flutter/material.dart';

class AppFonts {
  static TextStyle primaryFont({
    double fontSize = FontSize.font14,
    String fontFamily = AppConfig.fontFamily,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}

class AppStyle {
  static TextStyle regular({
    double? fontSize = FontSize.font14,
    String? fontFamily = AppConfig.fontFamily,
    Color color = Colors.black,
  }) =>
      AppFonts.primaryFont(
          fontSize: fontSize!, fontFamily: fontFamily!, color: color);
  static TextStyle medium({
    double? fontSize = FontSize.font14,
    String? fontFamily = AppConfig.fontFamily,
    Color color = Colors.black,
  }) =>
      AppFonts.primaryFont(
          fontSize: fontSize!,
          fontFamily: fontFamily!,
          fontWeight: FontWeight.w500,
          color: color);
  static TextStyle semiBold({
    double? fontSize = FontSize.font14,
    String? fontFamily = AppConfig.fontFamily,
    Color color = Colors.black,
  }) =>
      AppFonts.primaryFont(
          fontSize: fontSize!,
          fontFamily: fontFamily!,
          fontWeight: FontWeight.w600,
          color: color);
  static TextStyle bold({
    double? fontSize = FontSize.font14,
    String? fontFamily = AppConfig.fontFamily,
    Color color = Colors.black,
  }) =>
      AppFonts.primaryFont(
          fontSize: fontSize!,
          fontFamily: fontFamily!,
          fontWeight: FontWeight.bold,
          color: color);
  static TextStyle light({
    double? fontSize = FontSize.font14,
    String? fontFamily = AppConfig.fontFamily,
    Color color = Colors.black,
  }) =>
      AppFonts.primaryFont(
          fontSize: fontSize!,
          fontFamily: fontFamily!,
          fontWeight: FontWeight.w300,
          color: color);
  static TextStyle extraLight({
    double? fontSize = FontSize.font14,
    String? fontFamily = AppConfig.fontFamily,
    Color color = Colors.black,
  }) =>
      AppFonts.primaryFont(
          fontSize: fontSize!,
          fontFamily: fontFamily!,
          fontWeight: FontWeight.w200,
          color: color);
  static TextStyle thin({
    double? fontSize = FontSize.font14,
    String? fontFamily = AppConfig.fontFamily,
    Color color = Colors.black,
  }) =>
      AppFonts.primaryFont(
          fontSize: fontSize!,
          fontFamily: fontFamily!,
          fontWeight: FontWeight.w100,
          color: color);
}

class FontSize {
  static const double font5 = 5.0;
  static const double font6 = 6.0;
  static const double font7 = 7.0;
  static const double font8 = 8.0;
  static const double font9 = 9.0;
  static const double font10 = 10.0;
  static const double font11 = 11.0;
  static const double font12 = 12.0;
  static const double font13 = 13.0;
  static const double font14 = 14.0;
  static const double font15 = 15.0;
  static const double font16 = 16.0;
  static const double font17 = 17.0;
  static const double font18 = 18.0;
  static const double font19 = 19.0;
  static const double font20 = 20.0;
  static const double font21 = 21.0;
  static const double font22 = 22.0;
  static const double font23 = 23.0;
  static const double font24 = 24.0;
  static const double font25 = 25.0;
  static const double font26 = 26.0;
  static const double font27 = 27.0;
  static const double font28 = 28.0;
  static const double font29 = 29.0;
  static const double font30 = 30.0;
  static const double font31 = 31.0;
  static const double font32 = 32.0;
  static const double font33 = 33.0;
  static const double font34 = 34.0;
  static const double font35 = 35.0;
  static const double font36 = 36.0;
  static const double font37 = 37.0;
  static const double font38 = 38.0;
  static const double font39 = 39.0;
  static const double font40 = 40.0;
  static const double font70 = 70.0;
}
