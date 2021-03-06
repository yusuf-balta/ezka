import 'package:ezka/constans/app_border.dart';
import 'package:ezka/constans/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constans/color/app_color.dart';

class AppTextInput extends StatelessWidget {
  const AppTextInput({
    Key? key,
    required this.controller,
    this.onChanged,
    this.labelText,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.maxLength,
    this.readOnly = false,
    this.suffixIcon,
    this.obscureText = false,
    this.prefixIcon,
    this.inputFormatter,
  }) : super(key: key);

  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final Function(String value)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyle().hintTextStyle,
      inputFormatters: inputFormatter,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: maxLength,
      onChanged: onChanged,
      readOnly: readOnly,
      controller: controller,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return " Boş Bırakılamaz";
            }
            return null;
          },
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelStyle: AppTextStyle().hintTextStyle,
        hintStyle: AppTextStyle().hintTextStyle,
        counterText: '',
        contentPadding: prefixIcon == null ? const EdgeInsets.only(left: 20) : const EdgeInsets.all(0),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: labelText,
        hintText: hintText,
        filled: true,
        focusedErrorBorder: AppBorder().appTextInputBorder,
        errorBorder: AppBorder().appTextInputBorder,
        fillColor: AppColor().textInputFillColor,
        enabledBorder: AppBorder().appTextInputBorder,
        focusedBorder: AppBorder().appTextInputBorder,
      ),
    );
  }
}
