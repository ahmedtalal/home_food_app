import 'package:get/get_state_manager/get_state_manager.dart';

class HomePageController extends GetxController {
  int currentIndex = 0;

  switchPages(int? index) {
    currentIndex = index!;
    update();
  }
}
