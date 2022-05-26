import 'package:ezka/constans/app_padding.dart';
import 'package:ezka/constans/color/app_gradient.dart';
import 'package:ezka/constans/extensions/context_extension.dart';
import 'package:ezka/screens/home_screen/home_view.dart';
import 'package:ezka/screens/register_screen/register_controller.dart';
import 'package:ezka/services/validation_service.dart';
import 'package:ezka/widgets/app_scaffold.dart';
import 'package:ezka/widgets/app_text_input_second.dart';
import 'package:ezka/widgets/custom_spacer.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import '../../widgets/app_button.dart';

class RegisterView extends StatelessWidget {
  static String routeName = "/register-view";
  RegisterView({Key? key}) : super(key: key);

  final RegisterController registerController = Get.put(RegisterController(), tag: RegisterController.instanceName);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Container(
        height: context.height,
        width: context.width,
        decoration: BoxDecoration(gradient: AppGradient().backGroundGradient),
        padding: EdgeInsets.symmetric(horizontal: AppPadding().horizonPaddingX2),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomSpacer(isHeight: true),
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
              AppTextInputSecond(
                controller: registerController.nameController,
                hintText: "Ad",
              ),
              const CustomSpacer(isHeight: true),
              AppTextInputSecond(
                controller: registerController.surNameController,
                hintText: "Soyadı",
              ),
              const CustomSpacer(isHeight: true),
              AppTextInputSecond(
                controller: registerController.birthDateController,
                hintText: "Doğum Tarihi",
              ),
              const CustomSpacer(isHeight: true),
              AppTextInputSecond(
                controller: registerController.emailController,
                hintText: "Email",
                validator: (value) => ValidationService().validateEmailField(value),
              ),
              const CustomSpacer(isHeight: true),
              AppTextInputSecond(
                controller: registerController.passwordController,
                hintText: "Password",
              ),
              const CustomSpacer(isHeight: true),
              Container(
                alignment: Alignment.centerRight,
                child: AppButton(
                  onPressed: () async {
                    if (await registerController.signUp(context)) {
                      Get.offAllNamed(HomeView.routeName);
                    }
                  },
                  text: "ÜYE OL",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
