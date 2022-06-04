// ignore_for_file: unused_local_variable, avoid_print, unused_import, unnecessary_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../app/modules/home/controller/home_controller.dart';
import '../../../../../constant.dart';
import '../../../core/data/models/novelList.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    print(controller.novelList);
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
