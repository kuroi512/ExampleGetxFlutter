// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../app/modules/login/screens/signup_screen.dart';

import '../../../../constant.dart';
import '../../home/screens/home_screen.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller =
      Get.put(LoginController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: height * 0.5,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                image: const DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage("images/6357791.png"),
                ),
              ),
            ),
            Container(
              width: width,
              height: height * 0.5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    // topLeft: Radius.circular(70),
                    ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Нэвтрэх',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      decorationColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //email............................................................
                  Container(
                    width: width - 60,
                    height: 45,
                    child: AppTextField(
                      controller: controller.usernameController,
                      textFieldType: TextFieldType.EMAIL,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: kMainColor,
                        ),
                        prefixIconColor: Colors.purple,
                        labelText: 'И-майл',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: width - 60,
                    height: 45,
                    child: AppTextField(
                      controller: controller.passController,
                      textFieldType: TextFieldType.PASSWORD,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: kMainColor,
                        ),
                        prefixIconColor: kMainColor,
                        labelText: 'Нууц үг',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90),
                        ),
                      ),
                    ),
                  ),

                  //button..............................................................
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(width - 60, 45),
                      primary: Colors.purple,
                      onPrimary: Colors.purple.shade800,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Text(
                      'Нэвтрэх',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => controller.loginUser(),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Нууц үг мартсан?',
                      style: TextStyle(color: Colors.purple, fontSize: 18),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupScreen(),
                      ),
                    ),
                    child: const Text(
                      'Хэрэв бүртгэлгүй бол энд дарна уу?',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
