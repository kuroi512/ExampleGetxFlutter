// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, non_constant_identifier_names, duplicate_ignore

import 'dart:convert';
import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';

import '../../constant.dart';
import '../app/core/utils/log.dart';
import 'rest_connector.dart';
import 'dart:convert' as convert;

class LoginAPI {
  // ignore: non_constant_identifier_names
  Future<String?> sign_up_POST(
      String email, String password, String name) async {
    String result = 'error';
    const url = base_url + "api/user/signup";
    log(url);
    try {
      Response response = await RestConnector(
        url: url,
        requestType: "POST",
        clearCookies: true,
        dataType: "json",
        data: convert.jsonEncode(
          {
            "email": email,
            "password": password,
            "name": name,
          },
        ),
      ).postData();
      log(response);
      result = jsonEncode((response.data as Map<String, dynamic>));
      //final user = User.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.statusCode);
        if (e.response!.statusCode == 401) {
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

  Future<String?> login_POST(
    String username,
    String password,
  ) async {
    String result = 'error';
    const url = base_url + "api/user/login";
    log(url);
    try {
      //Response response = await Dio().get(url); //GET ---> Response response = await RestConnector(url: url).getData();
      Response response = await RestConnector(
        url: url,
        requestType: "POST",
        clearCookies: true,
        dataType: "json",
        data: convert.jsonEncode(
          {
            "email": username,
            "password": password,
          },
        ),
      ).postData();
      log(response);
      result = jsonEncode((response.data as Map<String, dynamic>));
      //final user = User.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.statusCode);
        if (e.response!.statusCode == 401) {
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
