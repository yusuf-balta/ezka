import 'package:ezka/constans/app_padding.dart';
import 'package:ezka/constans/app_text_style.dart';
import 'package:ezka/constans/color/app_gradient.dart';
import 'package:ezka/constans/extensions/context_extension.dart';
import 'package:ezka/model/user_model.dart';
import 'package:ezka/widgets/app_scaffold.dart';
import 'package:ezka/widgets/custom_spacer.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class DetailScreen extends StatelessWidget {
  static String routeName = "/detail-screen";
  const DetailScreen({Key? key, required this.userModel}) : super(key: key);

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Container(
        width: context.width,
        decoration: BoxDecoration(gradient: AppGradient().backGroundGradient),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 36,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: context.height * 0.2,
            ),
            Text(
              "Sonuç",
              style: AppTextStyle().hintTextStyle,
            ),
            const Divider(
              color: Colors.white,
            ),
            const CustomSpacer(isHeight: true),
            Container(
              margin: EdgeInsets.symmetric(horizontal: AppPadding().horizonPaddingX1),
              padding: EdgeInsets.symmetric(horizontal: AppPadding().horizonPaddingX1),
              width: context.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const CustomSpacer(isHeight: true),
                  Text(
                    "${userModel.name} ${userModel.surName}",
                    style: AppTextStyle().darkTextSyle,
                  ),
                  const CustomSpacer(isHeight: true),
                  Text(
                    "Adres: ${userModel.cityName} ${userModel.countyName} ${userModel.streetName}",
                    style: AppTextStyle().redTextStyle,
                  ),
                  const CustomSpacer(isHeight: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
