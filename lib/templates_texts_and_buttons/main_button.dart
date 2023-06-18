import 'package:flutter/material.dart';

class MainButtonWidget extends StatelessWidget {
  final bool? isResponsive;
  final double? width;
  const MainButtonWidget(
      {Key? key, this.width = 120, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.indigoAccent,
        borderRadius: BorderRadius.circular(15),
      ),
      width: isResponsive == true ? double.maxFinite : width,
      height: 55,
      child: Row(
        mainAxisAlignment: isResponsive == true
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          isResponsive == true
              ? Container(
            margin: const EdgeInsets.only(left: 20),
            child: const Text(
              'Book Trip now',
              style: TextStyle(color: Colors.white),
            ),
          )
              : Container(),
          const Icon(Icons.keyboard_double_arrow_right_sharp,
                color: Colors.white),

        ],
      ),
    );
  }
}
