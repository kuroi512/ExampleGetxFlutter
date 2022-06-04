import 'dart:async';

import 'package:exampleapp/app/modules/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../app/modules/login/screens/login_screen.dart';
import '../../../../app/modules/onboard/onboard.dart';

import '../../../constant.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 4));

    defaultBlurRadius = 10.0;
    defaultSpreadRadius = 0.5;

    finish(context);
    HomeView().launch(context);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   height: 100,
          //   width: width * 0.6,
          //   decoration: const BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage("images/monovel.png"),
          //         fit: BoxFit.fitWidth,
          //       ),
          //       color: Colors.white),
          // ),
          const SizedBox(
            height: 50,
          ),
          // const Center(
          //   child: Text('data')
          // ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'AppName',
                  style: TextStyle(color: Colors.blue[900], fontSize: 30),
                ),
                Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 170,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'This is my page',
                  style: kTextStyle.copyWith(
                    fontSize: 14.0,
                    color: Colors.blue[900],
                  ),
                ),
                Text(
                  'Version: v1.0',
                  style: kTextStyle.copyWith(
                    fontSize: 14.0,
                    color: Colors.blue[900],
                  ),
                ),
                // const SizedBox(
                //   height: 50.0,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
