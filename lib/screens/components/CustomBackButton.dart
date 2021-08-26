import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onpress;

  const CustomBackButton({Key? key, required this.onpress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(size.width * 0.05, 0, 0, 0),
      width: size.width * 0.1,
      height: size.width * 0.1,
      child: TextButton(
          onPressed: onpress, child: SvgPicture.asset("assets/icons/back.svg")),
    );
  }
}
