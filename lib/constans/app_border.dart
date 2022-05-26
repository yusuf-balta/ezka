import 'package:flutter/material.dart';

import 'color/app_color.dart';

class AppBorder {
  InputBorder get appTextInputBorder => OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          width: 3,
          color: AppColor().textInputBorderColor,
        ),
      );

  InputBorder get appTextInputBorderSecond => const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          width: 0,
        ),
      );

  InputBorder get appTextInputBorderUnderline => const UnderlineInputBorder();
}
