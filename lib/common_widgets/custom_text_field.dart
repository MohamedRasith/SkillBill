import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/utils/constants.dart';
import '../core/utils/fonts.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final Function(String val)? callBack;
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefix;
  final Widget? suffix;
  final bool isEnabled;
  final TextStyle? style;
  final InputDecoration? decoration;
  final bool visible;
  final TextStyle? hintStyle;
  final FormFieldValidator? validate;
  final bool readOnly;
  final Function? onTapCallback;
  final int maxLines;
  final int maxLength;
  final EdgeInsets contentPadding;
  bool isObscure = true;
  bool isCollapsed;

  CustomTextField({
    required this.hintText,
    this.callBack,
    required this.controller,
    this.textInputType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.prefix,
    this.decoration,
    this.isEnabled = true,
    this.style,
    this.visible = false,
    this.hintStyle,
    this.validate,
    this.readOnly = false,
    this.onTapCallback,
    this.maxLines = 1,
    this.maxLength = 256,
    this.suffix,
    this.isObscure = false,
    this.contentPadding = const EdgeInsets.all(
      10
    ),
    this.isCollapsed = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        if (widget.onTapCallback != null) {
          widget.onTapCallback!();
        }
      },
      enabled: widget.isEnabled,
      cursorColor: Colors.blue,
      obscureText: widget.isObscure,
      showCursor: true,
      inputFormatters: widget.inputFormatters,
      controller: widget.controller,
      keyboardType: widget.textInputType,
      textCapitalization: widget.textCapitalization,
      textAlign: TextAlign.start,
      maxLines: widget.maxLines,
      validator: widget.validate,
      textAlignVertical: TextAlignVertical.top,
      textInputAction: TextInputAction.done,
      maxLength: widget.maxLength,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        prefix: widget.prefix,
        suffixIcon: widget.suffix,
        contentPadding: widget.contentPadding,
        filled: true,
        isCollapsed: widget.isCollapsed,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        // hintStyle:
        // AppFonts.lightStyle(fontSize: 120, fontColor: AppColors.grey,),
        fillColor: AppColors.transparent,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        counterText: '',
        focusedBorder: InputBorder.none,
      ),
      style: widget.style ??
          AppFonts.regularStyle(
            fontSize: 16,
            fontColor: AppColors.textColor,
          ),
      onChanged: (val) {
        if (widget.callBack != null) {
          widget.callBack!(val);
        }
      },
    );
  }
}
