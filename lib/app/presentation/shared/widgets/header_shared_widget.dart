import 'package:flutter/material.dart';
import 'package:social_media_network/app/config/screen_handler.dart';
import 'package:social_media_network/app/core/constants/strings.dart';

class HeaderSharedWidget extends StatelessWidget {
  final String title;
  const HeaderSharedWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenHandler.getScreenWidth(context),
      height: ScreenHandler.getScreenHeight(context) / 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: appFont,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.mode_night,
                  size: 25,
                ),
              ),
              const SizedBox(width: 15),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.shopping_cart,
                  size: 25,
                ),
              ),
              const SizedBox(width: 15),
              Image(
                image: AssetImage(personImage),
                width: 40,
                height: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}
