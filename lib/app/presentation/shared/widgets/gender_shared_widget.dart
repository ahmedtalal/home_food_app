import 'package:flutter/material.dart';

import '../../../core/constants/strings.dart';

class Gendersharedwidget extends StatelessWidget {
  final String genderType;
  final IconData icon;
  final Color iconColor, textColor, containerColor;
  final Function()? onClick;
  const Gendersharedwidget({
    required this.genderType,
    required this.icon,
    required this.containerColor,
    required this.iconColor,
    required this.textColor,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Card(
        color: containerColor,
        child: Container(
          height: 55,
          width: 55,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: iconColor,
              ),
              Text(
                genderType,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: appFont,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
