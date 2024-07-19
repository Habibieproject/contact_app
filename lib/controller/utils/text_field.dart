import 'package:contact_app/controller/utils/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTextField extends StatefulWidget {
  final bool readOnly;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.controller,
    this.suffixIcon,
    this.validator,
    this.readOnly = false,
    this.onChanged,
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
    if (_focusNode.hasFocus && widget.readOnly) {
      _showDatePicker();
    }
    setState(() {});
  }

  Future<void> _showDatePicker() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (selectedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
      widget.controller?.text = formattedDate;
    }
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      focusNode: _focusNode,
      style: AppStyle.regular(),
      validator: widget.validator,
      controller: widget.controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon != null
            ? IconTheme(
                data: IconThemeData(
                    color: _focusNode.hasFocus
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    size: 16),
                child: widget.prefixIcon!,
              )
            : null,
        suffixIcon: widget.suffixIcon != null
            ? IconTheme(
                data: IconThemeData(
                  color: _focusNode.hasFocus
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                  size: 16,
                ),
                child: widget.suffixIcon!,
              )
            : null,
      ),
    );
  }
}
