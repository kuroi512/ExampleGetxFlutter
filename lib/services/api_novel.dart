// ignore_for_file: prefer_interpolation_to_compose_strings, non_constant_identifier_names, avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart' hide Response hide FormData hide MultipartFile;
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'rest_connector.dart';
import 'dart:convert' as convert;

import '../../constant.dart';
import '../app/core/utils/log.dart';

class NovelApi {
  Future<String?> getNovel() async {
    String result = 'error';
    const url = base_url + "api/novel";
    try {
      Response response = await RestConnector(url: url).getData();
      result = jsonEncode((response.data as Map<String, dynamic>));
      return result;
    } catch (e) {
      log(e);
      return 'error' + e.toString();
    }
  }

  Future<String?> specificNovel_GET(novelId) async {
    print(novelId);
    String result = 'error';
    final url = base_url + "api/novel/" + novelId.toString();
    try {
      Response response = await RestConnector(url: url).getData();
      result = jsonEncode((response.data as Map<String, dynamic>));
      return result;
    } catch (e) {
      log(e);
      return 'error' + e.toString();
    }
  }

  Future<String?> novel_POST(
    novelTitle,
    novelDescription,
    novelGenre,
    novelLike,
    userId,
    novelReadCount,
    File imageFile,
  ) async {
    final url = base_url + "api/novel";
    // final urlGanaa = "http://192.168.17.185:8000/api/ttimeline/post";
    String result = 'error';
    String? token = GetStorage().read<String>('token');
    log(
      'SEND FILE CHECK ' +
          novelTitle +
          novelDescription +
          novelGenre +
          novelLike +
          userId +
          novelReadCount +
          imageFile.toString(),
    );
//------------------------------------------------------------------------------
    File file = imageFile;
    print("FILES+" + file.toString());
    //Form data dr files gesen ooriinh ni huvisagch ruu file aa hiine **zaawal**
    String fileName = file.path.split('/').last;
    print(fileName);

    FormData formData = FormData.fromMap({
      "novelTitle": novelTitle,
      "novelDescription": novelDescription,
      "novelGenre": novelGenre,
      "novelLike": novelLike,
      "userId": userId,
      "novelReadCount": novelReadCount,
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    });

    log('FORM DATA ' + formData.files.toString());
    try {
      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaatoken' + token.toString());
      Response response = await RestConnector(
        url: url,
        requestType: "POST",
        clearCookies: true,
        dataType: "json",
        formData: formData,
      ).postFileAuthData(token);

      result = jsonEncode((response.data as Map<String, dynamic>));
      //final user = User.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.statusCode);
        if (e.response!.statusCode == 401 || e.response!.statusCode == 110) {
          // refreshToken();
          return 'error401';
        }
        print('response data : ');
        print(e.response!.data);
        print('response headers : ' + e.response!.headers.toString());
        // print(e.response!.request);
      }
      print('error msg : ' + e.message);
      return 'error';
    } catch (e) {
      log('error : ' + e.toString());
      return 'error';
    }
    return result;
  }
}
