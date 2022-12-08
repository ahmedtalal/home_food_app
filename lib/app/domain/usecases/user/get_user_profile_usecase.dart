import 'package:social_media_network/app/data/services/local/storage_user_model.dart';
import 'package:social_media_network/app/domain/repositories/i_user_repository.dart';
import 'package:get/get.dart';

class GetUserProfileUseCase{
  final IUserRepository iUserRepository;
  const GetUserProfileUseCase({required this.iUserRepository});

  Future<Map<String, dynamic>> call() async {
    String userId = Get.find<StorageUserModel>().loadData()["id"];
    print("the user id is $userId");
    return await iUserRepository.getUserProfile(userId: userId);
  }
}

