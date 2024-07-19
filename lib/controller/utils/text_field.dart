import 'package:contact_app/controller/utils/theme/app_style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool readOnly;
  final String hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.readOnly = false,
  });
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      style: AppStyle.regular(),
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
      ),
    );
  }
}
