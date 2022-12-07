import 'package:social_media_network/app/domain/entities/user_entity.dart';

abstract class IUserRepository{
  Future<Map<String,dynamic>> getUserProfile({required String userId});
  Future<Map<String,dynamic>> getAllUsers();
  Future<Map<String,dynamic>> deleteUser({required String userId});
  Future<Map<String,dynamic>> updateUser({required UserEntity userEntity});
}