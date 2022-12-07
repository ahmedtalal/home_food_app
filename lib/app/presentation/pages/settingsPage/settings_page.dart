import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_network/app/config/screen_handler.dart';
import 'package:social_media_network/app/core/constants/strings.dart';
import 'package:social_media_network/app/presentation/pages/auth/logic/getx/auth_controller.dart';
import 'package:social_media_network/app/presentation/pages/auth/views/changepassword_page_view.dart';
import 'package:social_media_network/app/presentation/pages/settingsPage/widgets/settings_model_widget.dart';
import 'package:social_media_network/app/presentation/themes/theme_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  // static final controller = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: ScreenHandler.getScreenHeight(context),
      width: ScreenHandler.getScreenWidth(context),
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.only(top: ScreenHandler.getScreenHeight(context) / 11),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.red, width: 2.5),
                    ),
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(userImage),
                      height: 35,
                      width: 35,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ahmed Talal",
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: appFont,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3),
                      const Text(
                        "Edit Personal Details",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: appFont,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.chevron_right_rounded,
                  size: 32,
                ),
              ),
            ],
          ),
          SizedBox(height: ScreenHandler.getScreenHeight(context) / 17),
          SettingBodySections(
            title: "Dark Mode",
            image: darkModeImage,
            color: Colors.red,
            onClick: () {},
          ),
          const SizedBox(height: 20),
          const SettingHintBody(hint: "Profile"),
          SettingBodySections(
            title: "Edit Profile",
            image: editUserImage,
            color: Colors.teal,
            onClick: () {},
          ),
          const SizedBox(height: 10),
          SettingBodySections(
            title: "Change Password",
            image: changePasswordImage,
            color: Colors.purple,
            onClick: () {
              Get.to(() => ChangePasswordPageView());
            },
          ),
          const SizedBox(height: 20),
          const SettingHintBody(hint: "App"),
          SettingBodySections(
            title: "Share App",
            image: shareAppImage,
            color: const Color.fromARGB(255, 188, 201, 41),
            onClick: () {},
          ),
          const SizedBox(height: 10),
          SettingBodySections(
            title: "Rating App",
            image: ratingAppImage,
            color: Colors.orange,
            onClick: () {},
          ),
          const SizedBox(height: 20),
          const SettingHintBody(hint: "Others"),
          SettingBodySections(
            title: "Orders",
            image: ordersImage,
            color: const Color.fromARGB(255, 47, 185, 152),
            onClick: () {},
          ),
          const SizedBox(height: 10),
          GetBuilder<AuthController>(
              init: AuthController(),
              builder: (authController) {
                return SettingBodySections(
                  title: "LogOut",
                  image: logoutImage,
                  color: const Color.fromARGB(255, 230, 65, 120),
                  onClick: () {
                    authController.onClickLogoutBtn();
                  },
                );
              }),
          const SizedBox(height: 25),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "App ver 1.0.0",
              style: TextStyle(
                fontFamily: appFont,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
