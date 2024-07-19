import 'package:contact_app/controller/utils/theme/app_color.dart';
import 'package:contact_app/controller/utils/theme/app_style.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool? isOutline;
  final String? icon;
  final Color? color;

  const DefaultButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutline = false,
    this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: isOutline == true
            ? ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.white),
                padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 8)),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      color: AppColor.kBlackColor,
                    ),
                  ),
                ),
              )
            : ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: color ?? AppColor.kButtonColor,
                padding: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
        child: Text(
          text,
          style: AppStyle.bold(
                  color: isOutline == true
                      ? AppColor.kBlackColor
                      : AppColor.kPrimaryColor)
              .copyWith(fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
