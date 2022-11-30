import 'package:social_media_network/app/domain/entities/user_entity.dart';
import 'package:social_media_network/app/domain/repositories/i_auth_repository.dart';

class LoginUseCase {
  final IAuthRepository iAuthRepository;
  const LoginUseCase({required this.iAuthRepository});

  Future<Map<String, dynamic>> call(UserEntity userEntity) async =>
      await iAuthRepository.login(userEntity: userEntity);
}
