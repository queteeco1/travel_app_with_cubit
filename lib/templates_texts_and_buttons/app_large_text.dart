import 'package:flutter/material.dart';
import 'package:untitled/app_style/colors_app.dart';

class AppLargeTextWidget extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const AppLargeTextWidget(
      {Key? key, this.size = 30, this.color = kBlack, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: size, color: color),
    );
  }
}
