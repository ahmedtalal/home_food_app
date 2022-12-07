import 'package:social_media_network/app/domain/repositories/i_auth_repository.dart';

class LogOutUseCase{
  final IAuthRepository iAuthRepository;
  const LogOutUseCase({required this.iAuthRepository});

  Future<bool> call()async => await iAuthRepository.logOut();
}