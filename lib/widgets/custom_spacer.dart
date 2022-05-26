import 'package:ezka/constans/app_padding.dart';
import 'package:flutter/material.dart';

class CustomSpacer extends StatelessWidget {
  const CustomSpacer({Key? key, required this.isHeight}) : super(key: key);
  final bool isHeight;
  @override
  Widget build(BuildContext context) => isHeight
      ? SizedBox(
          height: AppPadding().verticalPaddingx2,
        )
      : SizedBox(
          width: AppPadding().horizonPaddingX2,
        );
}
