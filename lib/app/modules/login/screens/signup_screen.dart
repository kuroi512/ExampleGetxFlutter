// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../app/modules/login/screens/login_screen.dart';
import '../../../../constant.dart';
import '../controller/signup_controller.dart';

// import '../login_screen/login_screen.dart';

class SignupScreen extends StatelessWidget {
  final SignUpController controller =
      Get.put(SignUpController(), permanent: true);

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
              height: height * 0.4,
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
              height: height * 0.6,
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
                    'Бүртгүүлэх',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      decorationColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //email............................................................

                  Container(
                    width: width - 60,
                    height: 45,
                    child: AppTextField(
                      controller: controller.email,
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
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: width - 60,
                    height: 45,
                    child: AppTextField(
                      controller: controller.name,
                      textFieldType: TextFieldType.NAME,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: kMainColor,
                        ),
                        prefixIconColor: Colors.purple,
                        labelText: 'Хэрэглэгчийн нэр',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //password............................................................
                  Container(
                    width: width - 60,
                    height: 45,
                    child: AppTextField(
                      controller: controller.password,
                      textFieldType: TextFieldType.PASSWORD,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: kMainColor,
                        ),
                        prefixIconColor: Colors.purple,
                        labelText: 'Нууц үг',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //password............................................................
                  Container(
                    width: width - 60,
                    height: 45,
                    child: AppTextField(
                      controller: controller.repassword,
                      textFieldType: TextFieldType.PASSWORD,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: kMainColor,
                        ),
                        prefixIconColor: Colors.purple,
                        labelText: 'Нууц үг',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90),
                        ),
                      ),
                    ),
                  ),
                  //button..............................................................
                  const SizedBox(
                    height: 20,
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
                      'Бүртгүүлэх',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      controller.sign_up();
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    ),
                    child: const Text(
                      'Хэрэв бүртгэлтэй бол энд дарна уу?',
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
