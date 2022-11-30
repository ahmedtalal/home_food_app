import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageViewModel SliderPageView({
  required String title,
  required String body,
  required Widget image,
  required PageDecoration decoration,
}) {
  return PageViewModel(
    title: title,
    body: body,
    image: image,
    decoration: decoration,
  );
}
