// ignore_for_file: unnecessary_overrides, avoid_print, annotate_overrides, prefer_interpolation_to_compose_strings, unused_import, prefer_is_empty

import 'dart:convert';
import 'package:get/get.dart';
import '../../../../services/api_novel.dart';
import '../../../../app/core/utils/constant.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/api_chapter.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var currPage = 0.obs;
  // RxList chapter = [].obs;
  RxList chapterList = [].obs;
  RxList novelList = [].obs;

  void changeTab(index) {
    currPage.value = index;
  }

//Novel detail screen ru yvah
  String? id;
}
