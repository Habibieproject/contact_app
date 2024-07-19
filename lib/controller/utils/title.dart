import 'package:contact_app/controller/utils/theme/app_color.dart';
import 'package:contact_app/controller/utils/theme/app_style.dart';
import 'package:flutter/material.dart';

class TitleTextFieldConst extends StatelessWidget {
  const TitleTextFieldConst(
      {super.key, required this.title, this.isRequired = false, this.isItalic});
  final String title;
  final bool? isRequired;
  final bool? isItalic;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            child: RichText(
          text: TextSpan(
            text: title,
            style: isItalic == true
                ? AppStyle.regular(
                        fontSize: FontSize.font15,
                        color: AppColor.kPrimaryColor)
                    .copyWith(fontStyle: FontStyle.italic)
                : AppStyle.regular(fontSize: FontSize.font14),
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
