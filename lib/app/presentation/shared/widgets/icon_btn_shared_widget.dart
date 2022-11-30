import 'package:flutter/material.dart';

class IconBtnSharedWidget extends StatelessWidget {
  final Function()? onClick;
  final String icon;
  final double iconSize;
  const IconBtnSharedWidget({
    required this.icon,
    required this.iconSize,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Image(
        image: AssetImage(icon),
        width: iconSize,
        height: iconSize,
      ),
    );
  }
}
