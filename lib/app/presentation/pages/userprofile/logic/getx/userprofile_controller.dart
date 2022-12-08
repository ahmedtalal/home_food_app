import 'package:get/get.dart';

class UserProfileController extends GetxController{
  static UserProfileController _userProfileController = UserProfileController._internal();
  UserProfileController._internal();
  static UserProfileController get instance => _userProfileController;

  getUserProfileState(){
    // here i will write code to get user information using user id>>>>>>>
  }
}