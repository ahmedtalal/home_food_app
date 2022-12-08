import 'package:get/instance_manager.dart';
import 'package:social_media_network/app/presentation/pages/homePage/logic/home_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController.instance, fenix: true);
  }
}
