import 'dart:developer';

import 'package:ezka/widgets/app_dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginController extends GetxController {
  static String instanceName = "/login-controller";
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  Future<bool> signIn() async {
    try {
      UserCredential response = await firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      log(response.toString());
      return true;
    } catch (e) {
      AppDialogs.failedSnackbar(e.toString());
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
