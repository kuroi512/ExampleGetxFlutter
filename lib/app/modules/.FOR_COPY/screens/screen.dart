import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('My screen'),
      ),
    );
  }
}
