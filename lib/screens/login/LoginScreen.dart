import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/screens/components/RoundedButton.dart';
import 'package:frontend/screens/components/TextContainer.dart';
import 'package:frontend/screens/components/WelcomeBackground.dart';

class LoginScreen extends StatelessWidget {
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    bool obscurePassword = true;
    return Scaffold(
      body: WelcomeBackground(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            color: bg_transpearent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(size.width * 0.3),
                    child: Image.asset(
                      "assets/images/bg_chess.png",
                      width: size.width * 0.6,
                    ),
                  ),
                ),
                Text(
                  "Đăng nhập",
                  style: TextStyle(
                    fontSize: 25,
                    color: white,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextContainer(
                  child: TextField(
                    onChanged: (text) {
                      this.email = text;
                    },
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: dark_blue,
                        ),
                        hintText: "email"),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextContainer(
                  child: TextField(
                    onChanged: (text) {
                      this.password = text;
                    },
                    obscureText: obscurePassword,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: dark_blue,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            obscurePassword = true;
                          },
                          child: Icon(
                            Icons.visibility,
                            color: dark_blue,
                          ),
                        ),
                        hintText: "mật khẩu"),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  width: size.width * 0.8,
                  child: RoundedButton(
                      text: "Đăng nhập",
                      onpress: () {
                        print("email $email");
                      }),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Chưa có tài khoản ? ",
                      style: TextStyle(fontSize: 18, color: white),
                    ),
                    Text(
                      "Đăng kí ngay",
                      style: TextStyle(fontSize: 20, color: dark_blue),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
  // }
}
