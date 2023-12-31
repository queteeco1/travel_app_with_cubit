import 'package:flutter/material.dart';

class AppTextWidget extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const AppTextWidget(
      {Key? key,
        required this.text,
        this.size = 16,
        this.color = Colors.black54})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, color: color),
    );
  }
}
