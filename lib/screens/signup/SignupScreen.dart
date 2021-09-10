import 'package:flutter/material.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/screens/components/CircleChessBackground.dart';
import 'package:frontend/screens/components/RoundedButton.dart';
import 'package:frontend/screens/components/TextContainer.dart';
import 'package:frontend/screens/components/WelcomeBackground.dart';
import 'package:frontend/screens/home/HomeScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool obscurePassword = true;

  String username = "";

  String email = "";

  String password = "";

  void hideShowPass() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  void submit(context) {
    // signup with username, email, password variables
    // navigation
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: WelcomeBackground(
        child: Container(
          color: bg_transpearent,
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: CircleChessBackground()),
                Text("Đăng kí",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: TextContainer(
                      child: TextField(
                    onChanged: (text) {
                      username = text;
                    },
                    decoration: InputDecoration(
                      hintText: "tên đăng nhập",
                      icon: Icon(
                        Icons.account_circle,
                        color: dark_blue,
                      ),
                    ),
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: TextContainer(
                      child: TextField(
                    onChanged: (text) {
                      email = text;
                    },
                    decoration: InputDecoration(
                      hintText: "email",
                      icon: Icon(
                        Icons.email_sharp,
                        color: dark_blue,
                      ),
                    ),
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: TextContainer(
                      child: TextField(
                    obscureText: obscurePassword,
                    onChanged: (text) {
                      password = text;
                    },
                    decoration: InputDecoration(
                        hintText: "mật khẩu",
                        icon: Icon(
                          Icons.lock,
                          color: dark_blue,
                        ),
                        suffixIcon: GestureDetector(
                            onTap: hideShowPass,
                            child: Icon(
                              Icons.visibility,
                              color: dark_blue,
                            ))),
                  )),
                ),
                Container(
                  width: size.width * 0.8,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: RoundedButton(
                      text: "Đăng kí",
                      onpress: () {
                        submit(context);
                      }),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Đã có tài khoản ? ",
                      style: TextStyle(fontSize: 18, color: light),
                    ),
                    Text("Đăng nhập",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: dark_blue)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
