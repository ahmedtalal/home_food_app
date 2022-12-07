import 'package:social_media_network/app/data/services/apis/user_api_service.dart';
import 'package:social_media_network/app/domain/entities/user_entity.dart';
import 'package:social_media_network/app/domain/repositories/i_user_repository.dart';

class UserApiRepositoryImp implements IUserRepository{
  UserApiService _userApiService = UserApiService();
  @override
  Future<Map<String, dynamic>> deleteUser({required String userId}) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserProfile({required String userId})async {
    return await _userApiService.getUserProfile(id: userId);
  }

  @override
  Future<Map<String, dynamic>> updateUser({required UserEntity userEntity}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
  
}