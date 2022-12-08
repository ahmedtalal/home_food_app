import 'package:get/instance_manager.dart';
import 'package:social_media_network/app/presentation/pages/auth/logic/getx/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController.instance,fenix: true);
  }
}
