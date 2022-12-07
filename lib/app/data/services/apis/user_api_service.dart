import 'package:dio/dio.dart';
import 'package:social_media_network/app/core/constants/strings.dart';
import 'package:social_media_network/app/data/services/apis/api_helper.dart';

class UserApiService {
  ApiHelper _apiHelper = ApiHelper();
  Future<Map<String, dynamic>> getUserProfile({required String id}) async {
    try {
      final userId = {
        "id": id,
      };
      Response response =
          await _apiHelper.getRequest(path: "Users/", parameters: userId);
      if (response.statusCode == 200) {
        print("get user profile operation was done");
        return {
          mapKey: true,
          mapValue: response.data,
        };
      } else {
        print("get user profile operation was not done");
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
      return {
        mapKey: false,
        mapValue: e.toString(),
      };
    }
  }
}
