import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiHelper {
  const ApiHelper();
  static const apiAddress = "https://45.241.58.17:8443/api/";
  Dio _initDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: apiAddress,
        contentType: "application/json",
        headers: {
          "XApiKey": "X1X1pgH7QzFHJx4w46fI~5Uzi4RvtTwlEXp",
        },
      ),
    );
    if (apiAddress.toLowerCase().startsWith('https') && !kIsWeb) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient dioClient) {
        dioClient.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
        return dioClient;
      };
    }

    return dio;
  }

  Future<Response> postRequest(Map<String, dynamic> data, String path) async {
    Response response = await _initDio().post(path, data: data);
    print(response);
    return response;
  }

  Future<Response> getRequest(
    String path,
    Map<String, dynamic> parameters,
  ) async {
    return await _initDio().get(path, queryParameters: parameters);
  }

  Future<Response> putRequest(String path, Map<String, dynamic> data) async {
    return await _initDio().put(path, data: data);
  }

  Future<Response> deleteRequest(String path, Map<String, dynamic> parameters,
      Map<String, dynamic> data) async {
    return await _initDio().delete(
      path,
      data: data,
      queryParameters: parameters,
    );
  }
}
