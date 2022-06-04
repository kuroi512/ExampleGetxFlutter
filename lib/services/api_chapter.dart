// ignore_for_file: prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'dart:convert';
import 'package:get/get.dart' hide Response hide FormData hide MultipartFile;
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../constant.dart';
import '../app/core/utils/log.dart';
import 'rest_connector.dart';
import 'dart:convert' as convert;

class ChapterApi {
  Future<String?> get_chapter_GET() async {
    String result = 'error';
    const url = base_url + "api/chapter";
    try {
      Response response = await RestConnector(url: url).getData();
      result = jsonEncode((response.data as Map<String, dynamic>));
      return result;
    } catch (e) {
      log(e);
      return 'error' + e.toString();
    }
  }

  Future<String?> specific_chapter_GET(novelId) async {
    // print(novelId);
    String result = 'error';
    final url = base_url + "api/chapter/" + novelId.toString();
    try {
      Response response = await RestConnector(url: url).getData();
      result = jsonEncode((response.data as Map<String, dynamic>));
      return result;
    } catch (e) {
      log(e);
      return 'error' + e.toString();
    }
  }
}
