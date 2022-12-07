import 'package:social_media_network/app/domain/entities/user_entity.dart';

abstract class IAuthRepository {
  Future<Map<String, dynamic>> login({required UserEntity userEntity});
  Future<Map<String, dynamic>> register({required UserEntity userEntity});
  Future<Map<String, dynamic>> forgetPassword({required String email});
  Future<Map<String, dynamic>> updatePassword({
    required String oldPassword,
    required String newPassword,
  });
  Future<bool> logOut();
  bool checkIsLogin();
  Future<Map<String, dynamic>> loginUsingFacebook(dynamic data);
  Future<Map<String, dynamic>> loginUsingTwitter(dynamic data);
  Future<Map<String, dynamic>> loginUsingGoogle(dynamic data);
  Future<Map<String, dynamic>> loginUsingGitHub(dynamic data);
}
