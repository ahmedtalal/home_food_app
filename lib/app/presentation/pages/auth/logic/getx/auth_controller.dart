import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_network/app/core/constants/strings.dart';
import 'package:social_media_network/app/data/models/user_model.dart';
import 'package:social_media_network/app/data/repository/apis/auth_api_repository_imp.dart';
import 'package:social_media_network/app/data/services/local/storage_user_model.dart';
import 'package:social_media_network/app/domain/usecases/auth/login_usecase.dart';
import 'package:social_media_network/app/domain/usecases/auth/register_usecase.dart';
import 'package:social_media_network/app/presentation/pages/homePage/home_page.dart';

class AuthController extends GetxController {
  String userName = '';
  String email = '';
  String password = '';
  String phone = '';
  String firstName = '';
  String lastName = '';
  bool gender = false;
  final LoginUseCase _loginUseCase =
      LoginUseCase(iAuthRepository: AuthApiRepositoryImp());
  final RegisterUseCase _registerUseCase =
      RegisterUseCase(iAuthRepository: AuthApiRepositoryImp());

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
      Map<String, dynamic> data = await _loginUseCase.call(userModel);
      if (data[mapKey] == true) {
        print("the user model is >>> ${data[mapValue]}");
        Get.off(()=> HomePage);
      } else {
        Get.snackbar("auth Exception", data[mapValue]);
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
      Map<String, dynamic> data = await _registerUseCase.call(userModel);
      print(userModel.toString());
      if (data[mapKey] == true) {
        print("the user model is >>> ${data[mapValue]}");
        final storage = Get.find<StorageUserModel>();
       await storage .saveData(data[mapValue]);
       print("the user model storage is ${storage.loadData()}");
        Get.off(()=>HomePage());
      } else {
        print("error ");
        Get.snackbar("auth Exception", data[mapValue]);
      }
    }
  }
}
