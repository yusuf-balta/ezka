import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class ValidationService {
  String? validateEmailField(String? value) {
    if (GetUtils.removeAllWhitespace(value!).isEmpty) {
      return "Bu alan boş bırakılamaz";
    } else if (!GetUtils.isEmail(value)) {
      return "Lütfen geçerli bir email adresi giriniz";
    } else {
      return null;
    }
  }

  String? isPhoneNumber(String? value) {
    if (GetUtils.removeAllWhitespace(value!).isEmpty) {
      return "Bu alan boş bırakılamaz";
    } else if (value.length < 10 || value.length > 10) {
      return "Bu alan 10 karakter içermelidir.";
    }

    return null;
  }
}
