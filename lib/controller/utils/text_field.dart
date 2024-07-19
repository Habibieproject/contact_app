import 'package:contact_app/controller/utils/theme/app_style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool readOnly;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.controller,
    this.suffixIcon,
    this.validator,
    this.readOnly = false,
  });
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      focusNode: _focusNode,
      style: AppStyle.regular(),
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon != null
            ? IconTheme(
                data: IconThemeData(
                  color: _focusNode.hasFocus
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                ),
                child: widget.suffixIcon!,
              )
            : null,
      ),
    );
  }
}
