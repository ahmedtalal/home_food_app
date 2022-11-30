import 'package:flutter/material.dart';

import '../../../../config/screen_handler.dart';

Widget imageBuilder(String orderFoodImg, BuildContext context) {
  return Center(
    child: Image(
      image: AssetImage(orderFoodImg),
      width: ScreenHandler.getScreenWidth(context),
      height: ScreenHandler.getScreenHeight(context) / 1,
    ),
  );
}
