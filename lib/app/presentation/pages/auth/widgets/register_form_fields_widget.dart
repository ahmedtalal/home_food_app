// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_network/app/config/screen_handler.dart';
import 'package:social_media_network/app/core/constants/app_colors.dart';
import 'package:social_media_network/app/presentation/pages/auth/logic/getx/auth_controller.dart';
import 'package:social_media_network/app/presentation/pages/auth/views/login_page_view.dart';
import 'package:social_media_network/app/presentation/pages/auth/widgets/choice_auth_status_btn.dart';
import 'package:social_media_network/app/presentation/shared/widgets/text_form_field_shared_widget.dart';
import 'package:social_media_network/app/presentation/shared/widgets/text_link_shared_widget.dart';
import '../../../shared/widgets/gender_shared_widget.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({
    Key? key,
  }) : super(key: key);
  static var formKey = GlobalKey<FormState>();
  static bool? gender;
  static bool isMaleGender = false;
  static bool isFemaleGender = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ScreenHandler.getScreenHeight(context) / 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: ScreenHandler.getScreenHeight(context) / 14,
                    width: ScreenHandler.getScreenWidth(context) / 2.2,
                    child: TextFormFieldSharedWidget(
                      hint: "ahmed",
                      initialValue: "",
                      label: "first Name",
                      onChangeListenser: (String? newValue) {
                        controller.onChangeFirstName(newValue);
                      },
                      onValidateListenser: (String? value) {
                        return controller.onValidateField(value);
                      },
                      prefIcon: Icons.person,
                      textType: TextInputType.name,
                    ),
                  ),
                  SizedBox(
                    height: ScreenHandler.getScreenHeight(context) / 14,
                    width: ScreenHandler.getScreenWidth(context) / 2.2,
                    child: TextFormFieldSharedWidget(
                      hint: "talal",
                      initialValue: "",
                      label: "lastName",
                      onChangeListenser: (String? newValue) {
                        controller.onChangeLastName(newValue);
                      },
                      onValidateListenser: (String? value) {
                        return controller.onValidateField(value);
                      },
                      prefIcon: Icons.person,
                      textType: TextInputType.name,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 13),
              SizedBox(
                height: ScreenHandler.getScreenHeight(context) / 13,
                child: TextFormFieldSharedWidget(
                  hint: "app coder",
                  initialValue: "",
                  label: "UserName",
                  onChangeListenser: (String? newValue) {
                    controller.onChangeUserName(newValue);
                  },
                  onValidateListenser: (String? value) {
                    return controller.onValidateField(value);
                  },
                  prefIcon: Icons.person,
                  textType: TextInputType.name,
                ),
              ),
              const SizedBox(height: 13),
              SizedBox(
                height: ScreenHandler.getScreenHeight(context) / 13,
                child: TextFormFieldSharedWidget(
                  hint: "example@gmail.com",
                  initialValue: "",
                  label: "Email",
                  onChangeListenser: (String? newValue) {
                    controller.onChangeEmail(newValue);
                  },
                  onValidateListenser: (String? value) {
                    return controller.onValidateField(value);
                  },
                  prefIcon: Icons.email,
                  textType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 13),
              SizedBox(
                height: ScreenHandler.getScreenHeight(context) / 13,
                child: TextFormFieldSharedWidget(
                  hint: "Enter your phone",
                  initialValue: "",
                  label: "Phone",
                  onChangeListenser: (String? newValue) {
                    controller.onChangePhone(newValue);
                  },
                  onValidateListenser: (String? value) {
                    return controller.validatePhoneNumber(value);
                  },
                  prefIcon: Icons.phone,
                  textType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 13),
              SizedBox(
                height: ScreenHandler.getScreenHeight(context) / 13,
                child: TextFormFieldSharedWidget(
                  hint: "sEamlk12#@?",
                  initialValue: "",
                  label: "Password",
                  onChangeListenser: (String? newValue) {
                    controller.onChangePassword(newValue);
                  },
                  onValidateListenser: (String? value) {
                    return controller.validatePasswordField(value);
                  },
                  prefIcon: Icons.lock,
                  textType: TextInputType.visiblePassword,
                ),
              ),
              const SizedBox(height: 8),
              StatefulBuilder(
                builder: (context, setState) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Gendersharedwidget(
                        genderType: "Male",
                        containerColor: isMaleGender != false
                            ? customRadioColor
                            : Colors.white,
                        icon: Icons.male,
                        iconColor:
                            isMaleGender != false ? Colors.white : Colors.grey,
                        textColor:
                            isMaleGender != false ? Colors.white : Colors.grey,
                        onClick: () {
                          setState(() {
                            isMaleGender = true;
                            isFemaleGender = false;
                            gender = true;
                            controller.onChangeGender(gender!);
                            print(gender);
                          });
                        },
                      ),
                      const SizedBox(width: 8),
                      Gendersharedwidget(
                        genderType: "Female",
                        containerColor: isFemaleGender == true
                            ? customRadioColor
                            : Colors.white,
                        icon: Icons.female,
                        iconColor:
                            isFemaleGender == true ? Colors.white : Colors.grey,
                        textColor:
                            isFemaleGender == true ? Colors.white : Colors.grey,
                        onClick: () {
                          setState(() {
                            isFemaleGender = true;
                            isMaleGender = false;
                            gender = false;
                            controller.onChangeGender(gender!);
                            print(gender);
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              ChoiceAuthStatusBtn(
                controller: controller,
                title: "Register",
                formKey: formKey,
                onClick: () {
                  controller.onClickRegisterBtn(formKey);
                },
              ),
              const SizedBox(height: 10),
              TextLinkSharedWidget(
                title: "Do your have an account ?",
                authTitle: "Login",
                onClick: () {
                  Get.to(() => LoginPage());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
