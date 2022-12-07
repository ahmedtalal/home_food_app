import 'package:social_media_network/app/domain/repositories/i_user_repository.dart';

class GetUserProfileUseCase{
  final IUserRepository iUserRepository;
  const GetUserProfileUseCase({required this.iUserRepository});

  Future<Map<String, dynamic>> call({required String userId}) async =>
      await iUserRepository.getUserProfile(userId: userId);
}