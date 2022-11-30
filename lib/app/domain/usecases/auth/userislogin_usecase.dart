import 'package:social_media_network/app/domain/repositories/i_auth_repository.dart';

class UserIsLoginUseCase {
  final IAuthRepository iAuthRepository;
  const UserIsLoginUseCase({required this.iAuthRepository});

  bool call() => iAuthRepository.checkIsLogin();
}
