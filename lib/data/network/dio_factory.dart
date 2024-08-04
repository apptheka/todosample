import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import '../../app/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// ignore: constant_identifier_names
const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "Authorization";
const String TRAIN = "train";
const String AREA = "area";

const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  DioFactory();

  Future<Dio> getDio() async {
    var box = Hive.box(HiveConstant.ADD_BOX);
    Dio dio = Dio();
    int _timeOut = 60 * 1000;
    String token = box.get(HiveFieldConstant.TOKEN) ?? "";
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON
    };

    if (token.isNotEmpty) {
      // token = box.get(HiveFieldConstant.TOKEN);
      print(token);
      headers = {
        CONTENT_TYPE: APPLICATION_JSON,
        ACCEPT: APPLICATION_JSON,
        AUTHORIZATION: "Bearer $token",
      };
      dio.options = BaseOptions(
          baseUrl: Constant.baseUrl,
          connectTimeout: Duration(seconds: _timeOut),
          receiveTimeout: Duration(seconds: _timeOut),
          contentType: APPLICATION_JSON,
          headers: headers);
    } else {
      dio.options = BaseOptions(
          baseUrl: Constant.baseUrl,
          connectTimeout: Duration(seconds: _timeOut),
          receiveTimeout: Duration(seconds: _timeOut),
          contentType: APPLICATION_JSON,
          headers: headers);
    }

    if (kReleaseMode) {
      print("release mode no logs");
    } else {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseHeader: true));
    }
    return dio;
  }
}
