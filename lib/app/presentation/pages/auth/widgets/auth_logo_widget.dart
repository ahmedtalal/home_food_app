import 'package:flutter/material.dart';
import 'package:social_media_network/app/config/screen_handler.dart';
import 'package:social_media_network/app/core/constants/app_colors.dart';
import 'package:social_media_network/app/core/constants/strings.dart';

class AuthLogoWidget extends StatelessWidget {
  const AuthLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenHandler.setWidthSpacing(widthSpacing: 0.6, context: context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            "Hello \nThere",
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              height: 0.9,
              color: Colors.black,
              fontFamily: appFont,
            ),
          ),
          Container(
            width: 11,
            height: 11,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 3, bottom: 8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: customeColor4,
            ),
          ),
        ],
      ),
    );
  }
}
