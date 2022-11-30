import 'package:social_media_network/app/domain/entities/user_entity.dart';
import 'package:social_media_network/app/domain/repositories/i_auth_repository.dart';

class RegisterUseCase {
  final IAuthRepository iAuthRepository;
  const RegisterUseCase({required this.iAuthRepository});

  Future<Map<String, dynamic>> call(UserEntity userEntity) async =>
      await iAuthRepository.register(userEntity: userEntity);
}
