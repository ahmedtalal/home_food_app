import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_network/app/config/l10n/En.dart';
import 'package:social_media_network/app/config/screen_handler.dart';
import 'package:social_media_network/app/core/constants/strings.dart';
import 'package:social_media_network/app/presentation/pages/auth/logic/getx/auth_controller.dart';
import 'package:social_media_network/app/presentation/shared/widgets/text_form_field_shared_widget.dart';
import 'package:social_media_network/app/presentation/shared/widgets/text_link_shared_widget.dart';
import '../../../shared/widgets/icon_btn_shared_widget.dart';
import 'package:social_media_network/app/presentation/pages/auth/widgets/choice_auth_status_btn.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    Key? key,
  }) : super(key: key);
  static var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController.instance,
        builder: (controller) {
          return Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ScreenHandler.getScreenHeight(context) / 16),
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
                const SizedBox(height: 20),
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
                const SizedBox(height: 10),
                Container(
                  height: ScreenHandler.getScreenHeight(context) / 30,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {},
                    child: const Text(
                      forgetPasswordBtnEn,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: appFont,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ChoiceAuthStatusBtn(
                  controller: controller,
                  title: "Login",
                  formKey: formKey,
                  onClick: () {
                    controller.onClickLoginBtn(formKey);
                  },
                ),
                const SizedBox(height: 15),
                TextLinkSharedWidget(
                  title: "Do not have an account ?",
                  authTitle: "Register",
                  onClick: () {
                    Get.back();
                  },
                ),
                const SizedBox(height: 15),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    orTextEn,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: appFont,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconBtnSharedWidget(
                      icon: facebookImg,
                      iconSize: 35,
                      onClick: () {},
                    ),
                    const SizedBox(width: 10),
                    IconBtnSharedWidget(
                      icon: googleImg,
                      iconSize: 35,
                      onClick: () {},
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
