import 'package:flutter/material.dart';

class CircleChessBackground extends StatelessWidget {
  const CircleChessBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.6,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size.width * 0.3),
        child: Image.asset("assets/images/bg_chess.png"),
      ),
    );
  }
}
