import 'package:ezka/constans/app_text_style.dart';
import 'package:ezka/constans/color/app_color.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  Color? color;
  double? width;
  double fontSize;
  double height;
  double radius;
  TextStyle? textStyle;
  AppButton({Key? key, required this.onPressed, required this.text, this.color, this.width, this.fontSize = 12, this.height = 40, this.radius = 30, this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    color ??= AppColor().buttonColor;
    textStyle ??= AppTextStyle().buttonTextStyle;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: color!.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          primary: color,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColor().buttonBorderColor, width: 2),
            borderRadius: BorderRadius.circular(
              radius,
            ),
          ),
        ),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
