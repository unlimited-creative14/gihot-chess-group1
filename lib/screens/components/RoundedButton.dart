import 'package:flutter/material.dart';
import 'package:frontend/constant/color.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onpress;
  final Color backgroundColor, foregroundColor, textColor;
  final double textSize;
  const RoundedButton(
      {Key? key,
      required this.text,
      required this.onpress,
      this.backgroundColor = light_blue,
      this.foregroundColor = dark_blue,
      this.textSize = 25.0,
      this.textColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            backgroundColor: backgroundColor,
            onSurface: foregroundColor,
          ),
          onPressed: onpress,
          child: Text(
            text,
            style: TextStyle(fontSize: textSize, color: Colors.black),
          )),
    );
  }
}
