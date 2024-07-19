import 'package:contact_app/controller/utils/theme/app_color.dart';
import 'package:contact_app/controller/utils/theme/app_style.dart';
import 'package:flutter/material.dart';

class TitleTextFieldConst extends StatelessWidget {
  const TitleTextFieldConst({
    super.key,
    required this.title,
    this.isRequired = false,
  });
  final String title;
  final bool? isRequired;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            child: RichText(
          text: TextSpan(
            text: title,
            style: AppStyle.regular(fontSize: FontSize.font12),
            children: [
              if (isRequired == true)
                TextSpan(
                  text: ' *',
                  style: AppStyle.thin(
                    color: AppColor.kRedColor,
                    fontSize: FontSize.font16,
                  ),
                ),
            ],
          ),
        )),
      ],
    );
  }
}
