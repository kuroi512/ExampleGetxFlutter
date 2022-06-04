// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../services/api_login.dart';

import '../../../../routes/app_pages.dart';

class SignUpController extends GetxController {
  @override
  TextEditingController email = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");
  TextEditingController repassword = TextEditingController(text: "");
  TextEditingController name = TextEditingController(text: "");
  String token = '';
  RxBool isRegist = false.obs;
  checkPassword() {
    if (password.value != repassword.value) {
      Get.snackbar("Алдаа".tr, "Ижил нууц үг бичнэ үү...".tr);
      return false;
    }
    return true;
  }

  // ignore: non_constant_identifier_names
  sign_up() async {
    if (!checkPassword()) return;
    String? response = await LoginAPI().sign_up_POST(
      email.text,
      password.text,
      name.text,
    );
    if (response == 'error401') {
      Get.snackbar("Алдаа".tr, "Дахин оролдоно уу ...".tr);
      Get.to(Routes.SIGNUP);
    }
    Map<String, dynamic> data = jsonDecode(response!);

    print('-------------THIS IS SIGN UP DATA ----------------------');
    if (data['success'] == true && data['token'] != null) {
      token = data['token'];
      Get.toNamed(Routes.LOGIN);
      Get.snackbar("Амжилттай".tr, "Бүртгэгдлээ".tr);
    }
  }
}
