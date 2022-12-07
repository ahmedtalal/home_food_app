import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_network/app/core/constants/app_colors.dart';
import 'package:social_media_network/app/core/constants/strings.dart';
import 'package:social_media_network/app/data/models/user_model.dart';
import 'package:social_media_network/app/data/repository/apis/auth_api_repository_imp.dart';
import 'package:social_media_network/app/data/services/local/storage_user_model.dart';
import 'package:social_media_network/app/domain/usecases/auth/changePassword_usecase.dart';
import 'package:social_media_network/app/domain/usecases/auth/login_usecase.dart';
import 'package:social_media_network/app/domain/usecases/auth/logout_usecase.dart';
import 'package:social_media_network/app/domain/usecases/auth/register_usecase.dart';
import 'package:social_media_network/app/presentation/pages/homePage/home_page.dart';
import 'package:social_media_network/app/presentation/pages/splashscreen/splash_screen_page.dart';

class AuthController extends GetxController {
  String userName = '';
  String email = '';
  String password = '';
  String newPassword = '';
  String phone = '';
  String firstName = '';
  String lastName = '';
  bool gender = false;
  bool isLoadingIcon = false;
  final LoginUseCase _loginUseCase =
      LoginUseCase(iAuthRepository: AuthApiRepositoryImp());
  final RegisterUseCase _registerUseCase =
      RegisterUseCase(iAuthRepository: AuthApiRepositoryImp());
  final ChangePasswordUseCase _passwordUseCase = ChangePasswordUseCase(
    iAuthRepository: AuthApiRepositoryImp(),
  );

  onChangeUserName(String? value) {
    userName = value!;
    update();
  }

  onChangeFirstName(String? value) {
    firstName = value!;
    update();
  }

  onChangeLastName(String? value) {
    lastName = value!;
    update();
  }

  onChangeEmail(String? value) {
    email = value!;
  }

  onChangePassword(String? value) {
    password = value!;
    update();
  }

  onChangeNewPassword(String? value) {
    newPassword = value!;
    update();
  }

  onChangePhone(String? value) {
    phone = value!;
    update();
  }

  onChangeGender(bool value) {
    gender = value;
    update();
  }

  String? onValidateField(String? value) {
    if (value!.isEmpty) {
      return "this field is required";
    } else {
      return null;
    }
  }

  String? validatePhoneNumber(String? newValue) {
    if (newValue!.isEmpty) {
      return "this field is required";
    } else if (newValue.length != 11 && !newValue.contains(RegExp(r'[A-Z]'))) {
      return "your phone is not validate and may be wrong ";
    } else if (newValue.substring(0, 3) == "011" ||
        newValue.substring(0, 3) == "012" ||
        newValue.substring(0, 3) == "015" ||
        newValue.substring(0, 3) == "010") {
      return null;
    }
    return null;
  }

  String? validatePasswordField(String? newValue) {
    if (newValue!.isEmpty) {
      return "this field is required";
    } else if (newValue.length != 5 && !newValue.contains(RegExp(r'[A-Z]'))) {
      return "weak password or must contain numbers and letters and @,#";
    }
    return null;
  }

  onClickLoginBtn(GlobalKey<FormState> key) async {
    UserModel userModel = UserModel(
      email: email,
      password: password,
    );
    if (key.currentState!.validate()) {
      _loadingIcon(true);
      final data = await _loginUseCase.call(userModel);
      if (data[mapKey] == true) {
        print("the user model is >>> ${data[mapValue]}");
        final storage = Get.find<StorageUserModel>();
        await storage.saveData(data[mapValue]);
        print("the user model storage is ${storage.loadData()}");
        Get.off(() => HomePage());
        _loadingIcon(false);
      } else {
        Get.snackbar(
          "auth Exception",
          data[mapValue],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: customeColor4,
          colorText: Colors.white,
          borderRadius: 15,
          margin: EdgeInsets.all(5),
          duration: Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
          icon: Icon(Icons.error),
          messageText: Text(
            data[mapValue].toString(),
            style: TextStyle(
              fontSize: 16,
              fontFamily: appFont,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          titleText: Text(
            "auth Exception",
            style: TextStyle(
              fontSize: 20,
              fontFamily: appFont,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
        _loadingIcon(false);
      }
    }
  }

  onClickRegisterBtn(GlobalKey<FormState> key) async {
    UserModel userModel = UserModel(
      userName: userName,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      phone: phone,
      gender: gender,
    );
    print(userModel.userName);
    if (key.currentState!.validate()) {
      _loadingIcon(true);
      Map<String, dynamic> data = await _registerUseCase.call(userModel);
      print(userModel.toString());
      if (data[mapKey] == true) {
        print("the user model is >>> ${data[mapValue]}");
        final storage = Get.find<StorageUserModel>();
        await storage.saveData(data[mapValue]);
        print("the user model storage is ${storage.loadData()}");
        Get.off(() => HomePage());
        _loadingIcon(false);
      } else {
        print("error ");
        Get.snackbar(
          "auth Exception",
          data[mapValue],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: customeColor4,
          colorText: Colors.white,
          borderRadius: 15,
          margin: EdgeInsets.all(5),
          duration: Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
          icon: Icon(Icons.error),
          messageText: Text(
            data[mapValue].toString(),
            style: TextStyle(
              fontSize: 16,
              fontFamily: appFont,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          titleText: Text(
            "auth Exception",
            style: TextStyle(
              fontSize: 20,
              fontFamily: appFont,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
        _loadingIcon(false);
      }
    }
  }

  onClickLogoutBtn() async {
    bool value =
        await LogOutUseCase(iAuthRepository: AuthApiRepositoryImp()).call();
    if (value == true) {
      Get.offAll(() => SplashScreenPage());
    } else {
      Get.snackbar(
        "auth Exception",
        "Error in logout operation",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: customeColor4,
        colorText: Colors.white,
        borderRadius: 15,
        margin: EdgeInsets.all(5),
        duration: Duration(seconds: 4),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
        icon: Icon(Icons.error),
        messageText: Text(
          "Error in logout operation",
          style: TextStyle(
            fontSize: 16,
            fontFamily: appFont,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        titleText: Text(
          "auth Exception",
          style: TextStyle(
            fontSize: 20,
            fontFamily: appFont,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }

  onClickChangePassword(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      _loadingIcon(true);
      final data = await _passwordUseCase.call(password, newPassword);
      if (data[mapKey] == true) {
        print("the response from change password is >>> ${data[mapValue]}");
        Get.back();
        _loadingIcon(false);
      } else {
        print("error ");
        Get.snackbar(
          "auth Exception",
          data[mapValue],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: customeColor4,
          colorText: Colors.white,
          borderRadius: 15,
          margin: EdgeInsets.all(5),
          duration: Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
          icon: Icon(Icons.error),
          messageText: Text(
            data[mapValue].toString(),
            style: TextStyle(
              fontSize: 16,
              fontFamily: appFont,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          titleText: Text(
            "auth Exception",
            style: TextStyle(
              fontSize: 20,
              fontFamily: appFont,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
        _loadingIcon(false);
      }
    }
  }

  // this is private method for class
  _loadingIcon(bool value) {
    isLoadingIcon = value;
    update();
  }
}
