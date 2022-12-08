import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:social_media_network/app/core/constants/strings.dart';
import 'package:social_media_network/app/data/models/user_model.dart';
import 'package:social_media_network/app/data/services/apis/api_helper.dart';
import 'package:social_media_network/app/domain/entities/user_entity.dart';

class AuthApiService {
  static AuthApiService _authApiService = AuthApiService._internal();
  AuthApiService._internal();
  static AuthApiService get instance => _authApiService;

  ApiHelper _apiHelper = ApiHelper.instance;

  Future<Map<String, dynamic>> registerApiService(UserEntity userEntity) async {
    try {
      Map<String, dynamic> data = UserModel.toJson(userEntity);
      Response response =
          await _apiHelper.postRequest(data: data, path: "Users");
      if (response.statusCode == 201) {
        print("success");
        return {
          mapKey: true,
          mapValue: response.data,
        };
      } else {
        print("failed");
        return {
          mapKey: false,
          mapValue: response.statusMessage,
        };
      }
    } on DioError catch (error) {
      print("dio error");
      return {
        mapKey: false,
        mapValue: error.response.toString(),
      };
    } catch (e) {
      print("catch error");
      return {
        mapKey: false,
        mapValue: e.toString(),
      };
    }
  }

  Future<Map<String, dynamic>> loginApiService(UserEntity userEntity) async {
    try {
      Response? response;
      if (userEntity.email!.contains("@")) {
        final data1 = {
          "email": userEntity.email,
          "password": userEntity.password,
        };
        print(data1.toString());
        response = await _apiHelper.getRequest(
            path: "Users/LoginByEmail", parameters: data1);
        //("the data is ${jsonDecode(response.data.toString())}");
        print(response.data);
      } else {
        final data2 = {
          "userName": userEntity.email,
          "password": userEntity.password,
        };
        print(data2.toString());
        response = await _apiHelper.getRequest(
            path: "Users/LoginByUsername", parameters: data2);
        //("the data is ${jsonDecode(response.data.toString())}");
        print(response.data);
      }
      if (response.statusCode == 200) {
        print("success");
        return {
          mapKey: true,
          mapValue: response.data,
        };
      } else {
        print("failed");
        return {
          mapKey: false,
          mapValue: response.statusMessage,
        };
      }
    } on DioError catch (error) {
      print("dio error");
      return {
        mapKey: false,
        mapValue: error.response.toString(),
      };
    } catch (e) {
      print("catch error");
      return {
        mapKey: false,
        mapValue: e.toString(),
      };
    }
  }

  Future<Map<String, dynamic>> changeUserPassword(
    String id,
    String oldPassword,
    String newPassword,
  ) async {
    try {
      var data = {
        "id": id,
        "oldPassword": oldPassword,
        "newPassword": newPassword,
      };
      print("the new model is ${data.toString()}");
      Response response = await _apiHelper.putRequest(
          queryParameter: data, path: "Users/ChangeUserPassword?");
      if (response.statusCode == 200) {
        print("success");
        return {
          mapKey: true,
          mapValue: response.data,
        };
      } else {
        print("failed");
        return {
          mapKey: false,
          mapValue: response.statusMessage,
        };
      }
    } on DioError catch (error) {
      print("dio error");
      return {
        mapKey: false,
        mapValue: error.response.toString(),
      };
    } catch (e) {
      print("catch error");
      return {
        mapKey: false,
        mapValue: e.toString(),
      };
    }
  }
}
