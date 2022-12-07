import 'package:social_media_network/app/domain/repositories/i_auth_repository.dart';

class ChangePasswordUseCase {
  final IAuthRepository iAuthRepository;
  const ChangePasswordUseCase({required this.iAuthRepository});

  Future<Map<String, dynamic>> call(
          String oldPassword, String newPassword) async =>
      await iAuthRepository.updatePassword(
          oldPassword: oldPassword, newPassword: newPassword);
}
