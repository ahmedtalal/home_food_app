import 'package:flutter/material.dart';
import 'package:social_media_network/app/config/l10n/En.dart';
import 'package:social_media_network/app/config/screen_handler.dart';
import 'package:social_media_network/app/core/constants/app_colors.dart';
import 'package:social_media_network/app/core/constants/strings.dart';
import 'package:social_media_network/app/core/utils/validate_fields.dart';
import 'package:social_media_network/app/presentation/pages/auth/views/register_page_view.dart';
import 'package:social_media_network/app/presentation/shared/widgets/Text_btn_shared_widget.dart';
import 'package:social_media_network/app/presentation/shared/widgets/text_form_field_shared_widget.dart';
import 'package:social_media_network/app/presentation/shared/widgets/text_link_shared_widget.dart';

import '../../../shared/widgets/icon_btn_shared_widget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    Key? key,
  }) : super(key: key);
  static var formKey = GlobalKey<FormState>();
  static String? email, password;
  @override
  Widget build(BuildContext context) {
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
                email = newValue;
              },
              onValidateLIstenser: (String? value) {
                return ValidationFields.validateField(value);
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
                password = newValue;
              },
              onValidateLIstenser: (String? value) {
                return ValidationFields.validatePasswordField(value);
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
          Align(
            alignment: Alignment.center,
            child: TextBtnSharedWidget(
              title: "Login",
              containerColor: customeColor3,
              textColor: Colors.white,
              containerBorderColor: customeColor3,
              onClick: () {},
            ),
          ),
          const SizedBox(height: 15),
          TextLinkSharedWidget(
            title: "Do not have an account ?",
            authTitle: "Register",
            onClick: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RegisterPage(),
                ),
              );
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
  }
}
