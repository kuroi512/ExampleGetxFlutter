// ignore_for_file: implementation_imports, prefer_interpolation_to_compose_strings
import 'package:dio/dio.dart';

import 'package:get_storage/get_storage.dart';

import 'package:dio/src/form_data.dart' as formdata;
import 'package:dio/src/response.dart' as resp;

import '../app/core/utils/log.dart';

class RestConnector {
  String url;
  String requestType;
  String data;
  formdata.FormData? formData;
  String dataType;
  bool clearCookies;
  RestConnector(
      {required this.url,
      this.requestType = "GET",
      this.data = "",
      this.formData, //: null,
      this.dataType = "json",
      this.clearCookies = false});

  Future<resp.Response> getData() async {
    try {
      Dio dio = Dio();
      RequestOptions requestOptions = RequestOptions(path: url);
      if (dataType == "json") {
        log("******** BEFORE JSON " +
            requestType +
            " REQUEST  ********* url:" +
            url +
            "; values:" +
            data.toString());
        requestOptions.headers = {
          Headers.contentTypeHeader: "application/json"
        };
        // String? myToken = GetStorage().read<String>("myToken");
        // if (myToken == null) myToken = "";
        // log("****** mToken in request:" + myToken);
        // requestOptions.headers["X-Csrf-Token"] = myToken;
        resp.Response response = await dio.request(
          url,
          data: data,
        );
        log("******** AFTER JSON request, response:" +
            response.data.toString());
        return response;
      } else if (dataType == "VIDEO") {
        log("******** BEFORE VIDEO UPLOAD  ********* ");
        requestOptions.headers = {
          Headers.contentTypeHeader: "application/json"
        };

        String? myToken = GetStorage().read<String>("myToken");
        myToken ??= "";
        log("****** mToken in request:" + myToken);
        requestOptions.headers["X-Csrf-Token"] = myToken;
        resp.Response response = await dio.request(
          url,
          data: formData,
          options: Options(
              method: requestType,
              headers: {Headers.contentTypeHeader: "application/json"}),
        );
        return response;
      } else {
        log("******** BEFORE OTHER REQUEST  ********* ");
        requestOptions.headers = {
          Headers.contentTypeHeader: "application/json"
        };

        String? myToken = GetStorage().read<String>("myToken");
        myToken ??= "";
        log("****** mToken in request:" + myToken);
        requestOptions.headers["X-Csrf-Token"] = myToken;
        resp.Response response = await dio.request(
          url,
          data: formData,
          options: Options(method: requestType),
        );
        return response;
      }
    } on DioError catch (e) {
      log("EXCEPTION DIO ERROR FROM GETDATA:" + e.toString());
      rethrow;
    } catch (e) {
      //print(x);
      log("EXCEPTION OTHER FROM GETDATA:" + e.toString());
      throw Exception();
      // }
    }
  }

  Future<resp.Response> postData() async {
    try {
      Dio dio = Dio();
      RequestOptions requestOptions = RequestOptions(path: url);
      if (dataType == "json") {
        log("******** BEFORE JSON " +
            requestType +
            " REQUEST  ********* url:" +
            url +
            "; values:" +
            data.toString());
        requestOptions.headers = {
          Headers.contentTypeHeader: "application/json"
        };
        String? myToken = GetStorage().read<String>("myToken");
        myToken ??= "";
        log("****** mToken in request:" + myToken);
        requestOptions.headers["X-Csrf-Token"] = myToken;
        resp.Response response = await dio.request(
          url,
          data: data,
          options: Options(method: requestType),
        );
        log("******** AFTER JSON request, response:" +
            response.data.toString());
        return response;
      } else if (dataType == "VIDEO ") {
        log("******** BEFORE VIDEO UPLOAD  ********* ");
        requestOptions.headers = {
          Headers.contentTypeHeader: "multipart/form-data"
        };

        String? myToken = GetStorage().read<String>("myToken");
        myToken ??= "";
        log("****** mToken in request:" + myToken);
        requestOptions.headers["X-Csrf-Token"] = myToken;
        resp.Response response = await dio.request(
          url,
          data: formData,
          options: Options(method: requestType),
        );
        return response;
      } else {
        log("******** BEFORE OTHER REQUEST  ********* ");
        requestOptions.headers = {
          Headers.contentTypeHeader: "application/json"
        };
        String? myToken = GetStorage().read<String>("myToken");
        myToken ??= "";
        log("****** mToken in request:" + myToken);
        requestOptions.headers["X-Csrf-Token"] = myToken;
        resp.Response response = await dio.request(
          url,
          data: formData,
          options: Options(method: requestType),
        );
        return response;
      }
    } on DioError catch (e) {
      log("EXCEPTION DIO ERROR FROM GETDATA:" + e.toString());
      rethrow;
    } catch (e) {
      log("EXCEPTION OTHER FROM GETDATA:" + e.toString());
      throw Exception();
    }
  }

  Future<resp.Response> postDataJson() async {
    try {
      Dio dio = Dio();
      RequestOptions requestOptions = RequestOptions(path: url);
      if (dataType == "json") {
        log("******** BEFORE JSON " +
            requestType +
            " REQUEST  ********* url:" +
            url +
            "; values:" +
            data.toString());
        requestOptions.headers = {
          Headers.contentTypeHeader: "application/json"
        };
        requestOptions.method = requestType;
        String? myToken = GetStorage().read<String>("myToken");
        myToken ??= "";
        log("****** mToken in request:" + myToken);
        requestOptions.headers["X-Csrf-Token"] = myToken;
        resp.Response response = await dio.request(
          url,
          data: data,
          options: Options(method: requestType),
        );
        log("******** AFTER JSON request, response:" +
            response.data.toString());
        return response;
      } else if (dataType == "VIDEO") {
        log("******** BEFORE VIDEO UPLOAD  ********* ");
        requestOptions.headers = {
          Headers.contentTypeHeader: "application/json",
        };
        String? myToken = GetStorage().read<String>("myToken");
        myToken ??= "";
        log("****** mToken in request:" + myToken);
        requestOptions.headers["X-Csrf-Token"] = myToken;
        resp.Response response = await dio.request(
          url,
          data: formData,
          options: Options(method: requestType),
        );
        return response;
      } else {
        log("******** BEFORE OTHER REQUEST  ********* ");
        requestOptions.headers = {
          Headers.contentTypeHeader: "application/json"
        };

        String? myToken = GetStorage().read<String>("myToken");
        myToken ??= "";
        log("****** mToken in request:" + myToken);
        requestOptions.headers["X-Csrf-Token"] = myToken;
        resp.Response response = await dio.request(
          url,
          data: formData,
          options: Options(method: requestType),
        );
        return response;
      }
    } on DioError catch (e) {
      log("EXCEPTION DIO ERROR FROM GETDATA:" + e.toString());
      rethrow;
    } catch (e) {
      //print(x);
      log("EXCEPTION OTHER FROM GETDATA:" + e.toString());
      throw Exception();
      // }
    }
  }

//Authorization-tai buyu assess token-teiger API duudah uyd
  Future<resp.Response> postAuthData(aToken) async {
    try {
      Dio dio = Dio();
      RequestOptions requestOptions = RequestOptions(path: url, headers: {
        'authorization': aToken,
      });
      if (dataType == "json") {
        log("******** BEFORE JSON " +
            requestType +
            " REQUEST  ********* url:" +
            url +
            "; values:" +
            data.toString());
        requestOptions.headers = {
          Headers.contentTypeHeader: "application/json",
          Headers.acceptHeader: "application/json",
        };

        String? token = GetStorage().read<String>("token");
        token ??= "";
        log("******aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa mToken in request:" + token);
        // requestOptions.headers["X-Csrf-Token"] = token;
        resp.Response response = await dio.request(
          url,
          data: data,
          options: Options(
            method: requestType,
            headers: {
              'Authorization': '$aToken',
            },
          ),
        );
        // String? rToken = GetStorage().read<String>('rtoken');
        // //button daraad access token shinchleh
        // onError(DioError error) async {
        //   if (error.response?.statusCode == 401) {}
        //   return error;
        // }

        log("******** AFTER JSON request, response:" +
            response.data.toString());
        return response;
      } else if (dataType == "VIDEO") {
        log("******** BEFORE VIDEO UPLOAD  ********* ");
        requestOptions.headers = {
          Headers.contentTypeHeader: "multipart/form-data",
          // HttpHeaders.authorizationHeader : '$aToken'
        };
        String? token = GetStorage().read<String>("token");
        token ??= "";
        log("****** mToken in request:" + token);
        requestOptions.headers["X-Csrf-Token"] = token;
        resp.Response response = await dio.request(
          url,
          data: formData,
          options: Options(method: requestType, headers: {
            'Authorization': '$aToken',
          }),
        );
        return response;
      } else {
        log("******** BEFORE OTHER REQUEST  ********* ");
        requestOptions.headers = {
          Headers.contentTypeHeader: "application/json",
        };
        String? myToken = GetStorage().read<String>("myToken");
        myToken ??= "";
        log("****** mToken in request:" + myToken);
        requestOptions.headers["X-Csrf-Token"] = myToken;
        resp.Response response = await dio.request(
          url,
          data: formData,
          options: Options(method: requestType, headers: {
            'Authorization': '$aToken',
          }),
        );
        return response;
      }
    } on DioError catch (e) {
      log("EXCEPTION DIO ERROR FROM GETDATA:" + e.toString());
      //mySnackbarWithRetry("checkInternet".tr);
      rethrow;
    } catch (e) {
      log("EXCEPTION OTHER FROM GETDATA:" + e.toString());
      throw Exception();
    }
  }

//File-tai haritsah uyd headers ni multi/form-data bh heregtei
  Future<resp.Response> postFileAuthData(aToken) async {
    try {
      Dio dio = Dio();

      RequestOptions requestOptions = RequestOptions(path: url, headers: {
        'authorization': aToken,
        'content-type': 'multipart/form-data'
      });

      //dio.options.headers["Content-Type"] = "multipart/form-data";

      log('REQ OP ---> ' + requestOptions.toString());

      if (dataType == "json") {
        log("******** BEFORE JSON " +
            requestType +
            " REQUEST  ********* url:" +
            url +
            "; values:" +
            formData.toString());
        requestOptions.headers = {
          Headers.contentTypeHeader: "multipart/form-data",
          // HttpHeaders.authorizationHeader : '$aToken',
        };

        log('-------------------------------------');

        String? myToken = GetStorage().read<String>("myToken");
        if (myToken == null) myToken = "";
        log("****** mToken in request:" + myToken);
        // requestOptions.headers["X-Csrf-Token"] = myToken;

        // log('OPTIONS ---->  ' + Options(
        //   method: requestType,
        //   headers: {
        //     'authorization': aToken,
        //     //'content-type': 'multipart/form-data',
        //   },
        // ).toString());

        resp.Response response = await dio.request(
          url,
          data: formData,
          options: Options(
              method: requestType,
              headers: {
                'authorization': aToken,
                'content-type': 'multipart/form-data',
              },
              contentType: 'multipart/form-data'),
        );
        String? rToken = GetStorage().read<String>('rtoken');
        log('**********************************************');
        //button daraad access token shinchleh
        onError(DioError error) async {
          if (error.response?.statusCode == 401) {}
          return error;
        }

        log("******** AFTER JSON request, response:" +
            response.data.toString());
        return response;
      } else if (dataType == "VIDEO") {
        log("******** BEFORE VIDEO UPLOAD  ********* ");
        requestOptions.headers = {
          Headers.contentTypeHeader: "multipart/form-data",
          // HttpHeaders.authorizationHeader : '$aToken'
        };

        String? myToken = GetStorage().read<String>("myToken");
        if (myToken == null) myToken = "";
        log("****** mToken in request:" + myToken);
        requestOptions.headers["X-Csrf-Token"] = myToken;

        resp.Response response = await dio.request(
          url,
          data: formData,
          options: Options(method: requestType, headers: {
            'Authorization': '$aToken',
            'content-type': 'multipart/form-data',
          }),
        );
        return response;
      } else {
        log("******** BEFORE OTHER REQUEST  ********* ");
        requestOptions.headers = {
          Headers.contentTypeHeader: "multipart/form-data",
          //HttpHeaders.authorizationHeader : '$aToken'
          //                                                                                                                                                                                               HttpHeaders.authorizationHeader:"Bearer $aToken"
        };

        String? myToken = GetStorage().read<String>("myToken");
        if (myToken == null) myToken = "";
        log("****** mToken in request:" + myToken);
        requestOptions.headers["X-Csrf-Token"] = myToken;

        resp.Response response = await dio.request(
          url,
          data: formData,
          options: Options(method: requestType, headers: {
            'Authorization': '$aToken',
          }),
        );
        return response;
      }
    } on DioError catch (e) {
      log("EXCEPTION DIO ERROR FROM GETDATA:" + e.toString());
      //mySnackbarWithRetry("checkInternet".tr);
      throw (e);
    } catch (e) {
      var x = e.toString();
      //print(x);
      log("EXCEPTION OTHER FROM GETDATA:" + e.toString());
      throw Exception();
      // }
    }
  }

  Future<resp.Response> deleteAuthData(aToken) async {
    try {
      Dio dio = Dio();

      RequestOptions requestOptions = RequestOptions(path: url, headers: {
        'authorization': aToken,
      });

      if (dataType == "json") {
        log("******** BEFORE JSON " +
            requestType +
            " REQUEST  ********* url:" +
            url +
            "; values:" +
            data.toString());
        requestOptions.headers = {
          Headers.contentTypeHeader: "application/json",
        };

        String? myToken = GetStorage().read<String>("myToken");
        myToken ??= "";
        log("****** mToken in request:" + myToken);
        requestOptions.headers["X-Csrf-Token"] = myToken;

        resp.Response response = await dio.request(
          url,
          data: data,
          options: Options(
            method: requestType,
            headers: {
              'authorization': '$aToken',
            },
          ),
        );

        log("******** AFTER JSON request, response:" +
            response.data.toString());
        return response;
      } else if (dataType == "VIDEO") {
        log("******** BEFORE VIDEO UPLOAD  ********* ");
        requestOptions.headers = {
          Headers.contentTypeHeader: "multipart/form-data",
        };

        String? myToken = GetStorage().read<String>("myToken");
        myToken ??= "";
        log("****** mToken in request:" + myToken);
        requestOptions.headers["X-Csrf-Token"] = myToken;

        resp.Response response = await dio.request(
          url,
          data: formData,
          options: Options(method: requestType, headers: {
            'Authorization': '$aToken',
          }),
        );
        return response;
      } else {
        log("******** BEFORE OTHER REQUEST  ********* ");
        requestOptions.headers = {
          Headers.contentTypeHeader: "application/json",
        };

        String? myToken = GetStorage().read<String>("myToken");
        myToken ??= "";
        log("****** mToken in request:" + myToken);
        requestOptions.headers["X-Csrf-Token"] = myToken;

        resp.Response response = await dio.request(
          url,
          data: formData,
          options: Options(method: requestType, headers: {
            'Authorization': '$aToken',
          }),
        );
        return response;
      }
    } on DioError catch (e) {
      log("EXCEPTION DIO ERROR FROM GETDATA:" + e.toString());

      rethrow;
    } catch (e) {
      log("EXCEPTION OTHER FROM GETDATA:" + e.toString());
      throw Exception();
    }
  }
}
