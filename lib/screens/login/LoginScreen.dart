import 'package:flutter/material.dart';
import 'package:frontend/component/AccountService.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/screens/components/CircleChessBackground.dart';
import 'package:frontend/screens/components/RoundedButton.dart';
import 'package:frontend/screens/components/TextContainer.dart';
import 'package:frontend/screens/components/WelcomeBackground.dart';
import 'package:frontend/screens/home/HomeScreen.dart';
import 'package:frontend/screens/signup/SignupScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";
  bool obscurePassword = true;
  AccountService accountService = AccountService();

  void changeHideShowPass() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  void submit(context) async {
    print("email : $email");
    print("password: $password");
    // submit with email and password variables
    // var respone = await accountService.login(email, password);
    // print(respone);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  void signup(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignupScreen()));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  child: CircleChessBackground(),
                ),
                Text(
                  "Đăng nhập",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
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
                            changeHideShowPass();
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
                        submit(context);
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
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        signup(context);
                      },
                      child: Text(
                        "Đăng kí ngay",
                        style: TextStyle(fontSize: 20, color: dark_blue),
                      ),
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
}
