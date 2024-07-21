import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:plants_informations/core/utils/end_points.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    debugPrint('dio service run');
    dio = Dio(BaseOptions(
      validateStatus: (_) => true,
      baseUrl: EndPoints.baseURL,
      receiveDataWhenStatusError: true,
    ));
    /// Disabling SSL Certificate Validation :
    (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  static Future<Response> get({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return dio!.get(
      url,
      queryParameters: query,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );
  }
}
