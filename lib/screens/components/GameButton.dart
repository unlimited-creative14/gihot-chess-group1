import 'package:flutter/material.dart';
import 'package:frontend/constant/color.dart';

class GameButton extends StatelessWidget {
  final Widget imgWidget;
  final String text;
  final double fontsize;
  final Color textColor;
  final VoidCallback onpress;

  const GameButton(
      {Key? key,
      required this.imgWidget,
      required this.text,
      required this.onpress,
      this.fontsize = 20,
      this.textColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.4,
      width: size.width * 0.4,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(size.width * 0.1)),
              child: Container(
                height: size.width * 0.25,
                width: size.width * 0.4,
                color: light_blue,
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              height: size.width * 0.25,
              width: size.width * 0.25,
              child: imgWidget,
            ),
          ),
          Positioned(
              bottom: size.width * 0.05,
              child: Text(
                text,
                style: TextStyle(fontSize: fontsize, color: textColor),
              ))
        ],
      ),
    );
  }
}
