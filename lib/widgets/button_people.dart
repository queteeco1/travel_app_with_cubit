import 'package:flutter/material.dart';

import '../templates_texts_and_buttons/app_text.dart';

class ButtonPeople extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  final String? text;
  final IconData? icon;
  final bool? isIcon;
  final bool? isText;

  const ButtonPeople(
      {super.key,
      this.isIcon,
      this.isText,
      this.text = 'Hi',
      this.icon,
      required this.color,
      required this.backgroundColor,
      required this.borderColor,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(right: 10),
      height: size,
      width: size,
      child: isIcon == false
          ? Center(
              child: AppTextWidget(
                text: text!,
                color: color,
              ),
            )
          : Center(
              child: Icon(
                icon,
                color: color,
                size: 22,
              ),
            ),
    );
  }
}
