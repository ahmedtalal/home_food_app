import 'package:social_media_network/app/core/constants/strings.dart';
import 'package:social_media_network/app/data/services/apis/auth_api_service.dart';
import 'package:social_media_network/app/data/services/local/storage_user_model.dart';
import 'package:social_media_network/app/domain/entities/user_entity.dart';
import 'package:social_media_network/app/domain/repositories/i_auth_repository.dart';
import 'package:get/get.dart';

class AuthApiRepositoryImp implements IAuthRepository {
  AuthApiService _authApiService = AuthApiService();
  @override
  bool checkIsLogin() {
    var data = Get.find<StorageUserModel>().loadData();
    if(data.isNotEmpty){
      return true ;
    }else {
      return false ;
    }
  }

  @override
  Future<Map<String, dynamic>> forgetPassword({required String email}) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> login({required UserEntity userEntity}) async {
    return await _authApiService.loginApiService(userEntity);
  }

  @override
  Future<Map<String, dynamic>> loginUsingFacebook(data) {
    // TODO: implement loginUsingFacebook
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> loginUsingGitHub(data) {
    // TODO: implement loginUsingGitHub
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> loginUsingGoogle(data) {
    // TODO: implement loginUsingGoogle
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> loginUsingtwitter(data) {
    // TODO: implement loginUsingtwitter
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> register(
      {required UserEntity userEntity}) async {
    return await _authApiService.registerApiService(userEntity);
  }

  @override
  Future<Map<String, dynamic>> updatePassword(
      {required String oldPassword, required String newPassword}) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }
}
