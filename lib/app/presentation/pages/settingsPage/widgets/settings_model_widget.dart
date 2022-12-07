import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_network/app/config/screen_handler.dart';
import 'package:social_media_network/app/core/constants/strings.dart';
import 'package:social_media_network/app/presentation/themes/theme_controller.dart';

class SettingHintBody extends StatelessWidget {
  final String hint;
  const SettingHintBody({
    required this.hint,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenHandler.getScreenWidth(context),
      height: 35,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 5),
      child: Text(
        hint,
        style: const TextStyle(
          fontSize: 12,
          fontFamily: appFont,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class SettingBodySections extends StatelessWidget {
  final String image, title;
  final Color color;
  final Function()? onClick;
  const SettingBodySections({
    required this.title,
    required this.image,
    required this.color,
    required this.onClick,
    Key? key,
  }) : super(key: key);
  static bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 33,
                width: 33,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: color,
                ),
                child: Image(
                  image: AssetImage(image),
                  height: 20,
                  width: 20,
                  color: Colors.white,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),
              Text(
                title,
                style: TextStyle(
                  fontFamily: appFont,
                  fontSize: title.toLowerCase() == "logout" ? 19 : 16,
                  fontWeight: title.toLowerCase() == "logout"
                      ? FontWeight.w800
                      : FontWeight.w600,
                  color: title.toLowerCase() == "logout"
                      ? Colors.red
                      :null,
                ),
              )
            ],
          ),
          title.toLowerCase() == "dark mode"
              ? GetBuilder<ThemeController>(builder: (controller) {
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Switch(
                        activeColor: Colors.blue,
                        inactiveTrackColor: Colors.grey,
                        value: isDarkMode,
                        onChanged: (value) {
                          if (Get.isDarkMode) {
                            controller.setThemeMode(ThemeMode.light);
                            controller.setThemeKeyValue(false);
                          } else {
                            controller.setThemeMode(ThemeMode.dark);
                            controller.setThemeKeyValue(true);
                          }
                          setState(
                            () {
                              isDarkMode = !isDarkMode;
                            },
                          );
                        },
                      );
                    },
                  );
                })
              : const Icon(
                  Icons.chevron_right_rounded,
                  size: 32,
                ),
        ],
      ),
    );
  }
}
