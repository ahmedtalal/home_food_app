import 'package:dio/dio.dart';
import 'package:social_media_network/app/core/constants/strings.dart';
import 'package:social_media_network/app/data/models/user_model.dart';
import 'package:social_media_network/app/data/services/apis/api_helper.dart';
import 'package:social_media_network/app/domain/entities/user_entity.dart';

class AuthApiService {
  ApiHelper _apiHelper = ApiHelper();
  Future<Map<String, dynamic>> registerApiService(UserEntity userEntity) async {
    Map<String, dynamic> data = UserModel.toJson(userEntity);
    Response response = await _apiHelper.postRequest(data, "Users");
    if (response.statusCode == 201) {
      print("succes");
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
  }

  Future<Map<String, dynamic>> loginApiService(UserEntity userEntity) async {
    Map<String, dynamic> data = UserModel.toJson(userEntity);
    Response response =
        await _apiHelper.postRequest(data, "Users/LoginByEmail");
    if (response.statusCode == 201) {
      return {
        mapKey: true,
        mapValue: response.data,
      };
    } else {
      return {
        mapKey: false,
        mapValue: response.statusMessage,
      };
    }
  }


}
