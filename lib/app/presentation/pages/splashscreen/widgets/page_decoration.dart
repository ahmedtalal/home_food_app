import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageDecoration getPageDecoration() {
  var appFont;
  return PageDecoration(
    titleTextStyle: TextStyle(
      fontSize: 24,
      fontFamily: appFont,
      fontWeight: FontWeight.bold,
    ),
    bodyTextStyle: TextStyle(
      fontSize: 16,
      fontFamily: appFont,
      color: Colors.grey[500],
      fontWeight: FontWeight.w600,
    ),
    bodyPadding: const EdgeInsets.all(10),
    titlePadding: const EdgeInsets.all(10),
  );
}
