import 'package:ezka/constans/color/app_color.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  TextStyle get hintTextStyle => const TextStyle(
        color: Colors.white,
        fontSize: 16,
      );
  TextStyle get hintTextStyleSecond => TextStyle(
        color: AppColor().textInputFillColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  TextStyle get buttonTextStyle => const TextStyle(color: Colors.red);

  TextStyle get searchButtonTextStyle => const TextStyle(color: Colors.white);

  TextStyle get darkTextSyle => const TextStyle(color: Color.fromARGB(255, 0, 32, 175), fontWeight: FontWeight.w500);
  TextStyle get redTextStyle => const TextStyle(color: Color.fromARGB(255, 250, 1, 1), fontWeight: FontWeight.w500);
}
