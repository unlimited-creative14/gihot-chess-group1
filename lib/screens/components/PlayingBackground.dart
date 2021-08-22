import 'package:flutter/material.dart';

class PlayingBackground extends StatelessWidget {
  final Widget child;
  const PlayingBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/room_background.png"),
                    fit: BoxFit.fill)),
          ),
          child,
        ],
      ),
    );
  }
}
