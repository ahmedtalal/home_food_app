import 'package:flutter/material.dart';
import 'package:social_media_network/app/core/constants/app_colors.dart';
import 'package:social_media_network/app/core/constants/strings.dart';

class TextLinkSharedWidget extends StatelessWidget {
  final Function() onClick;
  final String title, authTitle;
  const TextLinkSharedWidget({
    required this.title,
    required this.authTitle,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontFamily: appFont,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 5),
        InkWell(
          onTap: onClick,
          child: Text(
            authTitle,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: appFont,
              fontWeight: FontWeight.w600,
              color: customeColor3,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
              decorationThickness: 1.2,
            ),
          ),
        ),
      ],
    );
  }
}
