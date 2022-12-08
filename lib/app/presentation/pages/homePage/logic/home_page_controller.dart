import 'package:get/get_state_manager/get_state_manager.dart';

class HomePageController extends GetxController {
  static HomePageController _homePageController = HomePageController._internal();
  HomePageController._internal();
  static HomePageController get instance => _homePageController;
  int currentIndex = 0;

  switchPages(int? index) {
    currentIndex = index!;
    update();
  }
}
