import 'package:breakingbadapp/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio dio;

  static initi() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  Future<Response> getData({@required String url}) async {
    return await dio.get(url);
  }
}
