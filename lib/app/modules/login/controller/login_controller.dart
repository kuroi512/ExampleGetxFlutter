// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../routes/app_pages.dart';
import '../../../../services/api_login.dart';
import '../../../../app/core/globals.dart' as curUser;

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController(text: "");
  TextEditingController passController = TextEditingController(text: "");
  String accessToken = "";
  String refreshToken = "";
  var myUser_val = "".obs;

  // @override
  // void onInit() {
  //   String? myUser_str = GetStorage().read<String>('user');
  //   String? aToken = GetStorage().read<String>('atoken');

  //   String? rToken = GetStorage().read<String>('rtoken');

  //   if (aToken != null) accessToken = aToken;
  //   if (rToken != null) refreshToken = rToken;

  //   if (myUser_str != null) {
  //     //todo: hadgalsan user_id == login_user_id 2-g ijil esehiig shalgah! OLZII
  //     print('Login-onInit : myUser = ' + myUser_str);
  //     myUser_val.value = myUser_str;
  //     curUser.user = json.decode(myUser_str);
  //     print('Login-onInit : myUser.name = ' +
  //         curUser.user['name'].toString() +
  //         ' mobile = ' +
  //         curUser.user['mobile'].toString());
  //   }
  //   super.onInit();
  // }

  bool checkLoginUser() {
    String username = usernameController.text;
    String password = passController.text;
    if (username.length < 3) {
      Get.snackbar("Алдаа".tr, "Хэрэглэгчийн нэрээ оруулна уу...".tr);
      return false;
    } else if (password.length < 3) {
      Get.snackbar("Алдаа".tr, "Нууц үгээ оруулна уу...".tr);
      return false;
    }
    return true;
  }

  loginUser() async {
    if (!checkLoginUser()) return;
    print("login in controller....");
    Future.delayed(const Duration(seconds: 30), () => "5");
    String? response = await LoginAPI().login_POST(
      usernameController.text,
      passController.text,
    );
    print("login in controller....HTTP response = " + response!);
    String myUser_str = '{}';
    String myToken = '{}';
    if (response == 'error401') {
      Get.snackbar(
        "Алдаа".tr,
        "Уучлаарай та хэрэглэгчийн нэр эсвэл нууц үг эсвэл кодоо буруу оруулсан байна ! Дахин оролдоно уу ..."
            .tr,
      );
    } else if (response == 'error') {
      Get.snackbar(
          "Алдаа".tr, '⚠️ Сүлжээгээ шалгана уу, холболтын алдаа гарлаа !'.tr);
    } else {
      Map<String, dynamic> logindata = jsonDecode(response);
      // print('object' + logindata.toString());
      myToken = jsonEncode(logindata['atoken']);
      myUser_str = jsonEncode(logindata['user'][0]);
      print('get toookeen ' + myToken);
      GetStorage().write("user", myUser_str);
      GetStorage().write("token", myToken);
      GetStorage().write("myToken", myToken);
      Get.toNamed(Routes.HOME);
    }
  }
}
