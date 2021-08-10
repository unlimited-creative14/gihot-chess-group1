import 'package:flutter/material.dart';
import 'package:frontend/constant/color.dart';

class TextContainer extends StatelessWidget {
  final Widget child;
  const TextContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: light_blue, borderRadius: BorderRadius.circular(20)),
      child: child,
    );
  }
}
