import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_circular_progres.dart';

class AppDialogs {
  AppDialogs._();

  static loadingDialog(BuildContext context) {
    showDialog(
      barrierColor: Colors.black12,
      context: context,
      builder: (context) {
        return const AppCircularProgress();
      },
    );
  }

  static failedSnackbar(String message) {
    Get.snackbar('Başarısız', message, colorText: Colors.white, backgroundColor: Colors.red);
  }

  static succsesSnackbar(String message) {
    Get.snackbar('Başarılı', message, colorText: Colors.white, backgroundColor: Colors.green);
  }
}
