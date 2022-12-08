import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiHelper {

  // here using singletone pattern
  static ApiHelper _apiHelper = ApiHelper._internal();
  ApiHelper._internal();
  static ApiHelper get instance => _apiHelper;

  static const apiAddress = "http://abahay-001-site1.etempurl.com/api/";
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

  Future<Response> postRequest({
    Map<String, dynamic>? data,
    required String path,
    Map<String, dynamic>? parameters,
  }) async {
    Response response =
        await _initDio().post(path, data: data, queryParameters: parameters);
    print(response);
    return response;
  }

  Future<Response> getRequest({
    required String path,
    Map<String, dynamic>? parameters,
  }) async {
    return await _initDio().get(path, queryParameters: parameters);
  }

  Future<Response> putRequest({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameter,
  }) async {
    return await _initDio().put(path, data: data,queryParameters: queryParameter);
  }

  Future<Response> deleteRequest({required String path, Map<String, dynamic>? parameters,
      Map<String, dynamic>? data}) async {
    return await _initDio().delete(
      path,
      data: data,
      queryParameters: parameters,
    );
  }
}
