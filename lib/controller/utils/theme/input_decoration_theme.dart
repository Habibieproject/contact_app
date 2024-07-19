import 'package:contact_app/controller/utils/theme/app_color.dart';
import 'package:contact_app/controller/utils/theme/app_style.dart';
import 'package:flutter/material.dart';

InputDecorationTheme customInputDecorationTheme() {
  return InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: Colors.white,
      focusColor: AppColor.kPrimaryColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: AppColor.kPrimaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: AppColor.kPrimaryColor),
      ),
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
      hintStyle: AppStyle.regular(color: Colors.grey));
}
