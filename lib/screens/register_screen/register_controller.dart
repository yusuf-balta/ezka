import 'package:ezka/model/user_model.dart';
import 'package:ezka/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constans/enums/end_point.dart';
import '../../widgets/app_dialogs.dart';

class RegisterController extends GetxController {
  static String instanceName = "/register-controller";
  late final TextEditingController nameController;
  late final TextEditingController surNameController;
  late final TextEditingController birthDateController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  FireBaseService fireBaseService = FireBaseService();

  UserModel _setUserModel() {
    return UserModel(
      name: nameController.text,
      surName: surNameController.text,
      birthDate: birthDateController.text,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    surNameController.dispose();
    birthDateController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<bool> signUp(BuildContext context) async {
    AppDialogs.loadingDialog(context);
    try {
      UserCredential response = await fireBaseService.firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      fireBaseService.setData(
        endPoint: EndPoint.users.path,
        data: _setUserModel().toMap(),
      );
      Get.back();
      AppDialogs.succsesSnackbar("Kayıt Başarılı");
      return true;
    } catch (e) {
      Get.back();
      AppDialogs.failedSnackbar(e.toString());
      return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    surNameController = TextEditingController();
    birthDateController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
}
