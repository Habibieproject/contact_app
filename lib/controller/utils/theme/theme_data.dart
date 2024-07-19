import 'package:contact_app/controller/config/config.dart';
import 'package:contact_app/controller/utils/theme/app_color.dart';
import 'package:contact_app/controller/utils/theme/app_style.dart';
import 'package:contact_app/controller/utils/theme/input_decoration_theme.dart';
import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
      splashColor: AppColor.kPrimaryColor.withOpacity(0.2),
      colorScheme: ColorScheme.fromSeed(seedColor: AppColor.kPrimaryColor),
      scaffoldBackgroundColor: AppColor.kWhiteColor,
      dialogBackgroundColor: AppColor.kWhiteColor,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColor.kPrimaryColor,
          foregroundColor: AppColor.kWhiteColor),
      appBarTheme: AppBarTheme(
          centerTitle: false,
          titleTextStyle:
              AppStyle.bold(color: AppColor.kBlackColor, fontSize: 23),
          iconTheme: const IconThemeData(color: AppColor.kBlackColor),
          backgroundColor: AppColor.kWhiteColor),
      fontFamily: AppConfig.fontFamily,
      primaryColor: AppColor.kPrimaryColor,
      datePickerTheme: DatePickerThemeData(
          backgroundColor: AppColor.kLightGrayColor,
          todayBackgroundColor:
              const WidgetStatePropertyAll(AppColor.kPrimaryColor),
          todayBorder:
              const BorderSide(color: AppColor.kPrimaryColor, width: 0),
          dayStyle: AppStyle.medium(),
          inputDecorationTheme: customInputDecorationTheme(),
          headerHelpStyle: AppStyle.medium(),
          headerHeadlineStyle: AppStyle.bold(fontSize: 24),
          confirmButtonStyle: ButtonStyle(
              textStyle: WidgetStatePropertyAll(AppStyle.medium(
            color: AppColor.kPrimaryColor,
          ))),
          cancelButtonStyle: ButtonStyle(
            textStyle: WidgetStatePropertyAll(AppStyle.medium(
              color: AppColor.kPrimaryColor,
            )),
          )),
      primaryColorLight: AppColor.kPrimaryColor,
      inputDecorationTheme: customInputDecorationTheme(),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              textStyle: AppStyle.medium(),
              splashFactory: InkRipple.splashFactory)));
}
