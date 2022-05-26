import 'package:ezka/constans/color/app_gradient.dart';
import 'package:ezka/constans/extensions/context_extension.dart';
import 'package:ezka/screens/home_screen/home_view.dart';
import 'package:ezka/screens/login_screen/login_controller.dart';
import 'package:ezka/screens/register_screen/register_view.dart';
import 'package:ezka/services/validation_service.dart';
import 'package:ezka/widgets/app_button.dart';
import 'package:ezka/widgets/app_scaffold.dart';
import 'package:ezka/widgets/app_text_input.dart';
import 'package:ezka/widgets/custom_spacer.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import '../../constans/app_padding.dart';

class LoginView extends StatelessWidget {
  static String routeName = "/login-view";
  LoginView({Key? key}) : super(key: key);

  final LoginController loginController = Get.put(LoginController(), tag: LoginController.instanceName);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: AppPadding().horizonPaddingX2),
        height: context.height,
        width: context.width,
        decoration: BoxDecoration(gradient: AppGradient().backGroundGradient),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextInput(
                controller: loginController.emailController,
                labelText: "E-mail",
                hintText: "E-mail",
                validator: (value) => ValidationService().validateEmailField(value),
              ),
              const CustomSpacer(isHeight: true),
              AppTextInput(
                controller: loginController.passwordController,
                labelText: "Parola",
                hintText: "Parola",
              ),
              const CustomSpacer(isHeight: true),
              Container(
                alignment: Alignment.centerRight,
                child: AppButton(
                  onPressed: () async {
                    bool isValid = formKey.currentState?.validate() ?? false;
                    if (isValid) {
                      if (await loginController.signIn()) {
                        Get.offAndToNamed(HomeView.routeName);
                      }
                    }
                  },
                  text: "GİRİŞ YAP",
                ),
              ),
              const CustomSpacer(isHeight: true),
              Container(
                alignment: Alignment.centerRight,
                child: const Text(
                  "Parolamı unuttum",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const CustomSpacer(isHeight: true),
              GestureDetector(
                onTap: () {
                  Get.toNamed(RegisterView.routeName);
                },
                child: RichText(
                  text: const TextSpan(
                    text: 'Hesabınız Yok mu ? ',
                    style: TextStyle(color: Color.fromARGB(255, 250, 0, 0)),
                    children: [
                      TextSpan(
                        text: '  Üye Olun',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
