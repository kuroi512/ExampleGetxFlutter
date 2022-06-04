// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/core/utils/constant.dart';
import '../../../../app/core/utils/extensions.dart';
import '../controller/screen_controller.dart';

import '../../../../../constant.dart';

class AddnovelScreen extends StatelessWidget {
  final AddnovelController controller =
      Get.put(AddnovelController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text('This is page'),
          ),
        ),
      ),
    );
  }
}
