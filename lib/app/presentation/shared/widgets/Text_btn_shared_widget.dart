import 'package:flutter/material.dart';
import 'package:social_media_network/app/config/screen_handler.dart';
import 'package:social_media_network/app/core/constants/strings.dart';

class TextBtnSharedWidget extends StatelessWidget {
  final String? title;
  final Color? containerColor, textColor, containerBorderColor;
  final Function()? onClick;
  const TextBtnSharedWidget(
      {required this.title,
      required this.containerColor,
      required this.textColor,
      required this.containerBorderColor,
      required this.onClick,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick!,
      child: Container(
        width: ScreenHandler.getScreenWidth(context) / 1.15,
        height: ScreenHandler.getScreenHeight(context) / 13,
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: containerBorderColor!, width: 1.5),
          color: containerColor,
        ),
        child: Text(
          title!,
          style: TextStyle(
            color: textColor,
            fontFamily: appFont,
            fontWeight: FontWeight.w600,
            fontSize: 21,
          ),
        ),
      ),
    );
  }
}
