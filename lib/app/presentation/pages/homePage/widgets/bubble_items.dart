import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:social_media_network/app/core/constants/strings.dart';

BubbleBottomBarItem BubbleItems({
  required String title,
  required String iamge,
  required Color backgroundColor,
}) {
  return BubbleBottomBarItem(
    title: Text(
      title,
      style: TextStyle(
        fontFamily: appFont,
        fontSize: 13.0,
        color: Colors.white,
      ),
    ),
    backgroundColor: backgroundColor,
    icon: Image.asset(
      iamge,
      height: 17.0,
      color: Colors.black,
    ),
    activeIcon: Image.asset(
      iamge,
      height: 17.0,
      color: Colors.white,
    ),
  );
}
