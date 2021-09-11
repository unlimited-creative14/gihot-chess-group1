import 'package:flutter/material.dart';
import 'package:frontend/component/AccountService.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/generated/userInfo/user_info.pb.dart';
import 'package:frontend/screens/components/CircleChessBackground.dart';
import 'package:frontend/screens/components/RoundedButton.dart';
import 'package:frontend/screens/components/TextContainer.dart';
import 'package:frontend/screens/components/WelcomeBackground.dart';
import 'package:frontend/screens/home/HomeScreen.dart';
import 'package:frontend/screens/signup/SignupScreen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:frontend/component/UserInfo.dart';
import 'dart:convert' show json;

import "package:http/http.dart" as http;
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";
  bool obscurePassword = true;
  AccountService accountService = AccountService();
  UserService userService = UserService();
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  String _message = 'Log in/out by pressing the buttons below.';

  GoogleSignInAccount? _currentUser;
  String _contactText = '';

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact(_currentUser!);
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    setState(() {
      _contactText = "Loading contact info...";
    });
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = "People API gave a ${response.statusCode} "
            "response. Check logs for details.";
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String? namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = "I see you know $namedContact!";
      } else {
        _contactText = "No contacts to display.";
      }
    });
  }

  String? _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'];
    final Map<String, dynamic>? contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic>? name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
      if (_currentUser != null) {
        UserExist isExist = await userService.isExist(_currentUser!.email);
        if (!isExist.isExist) {
          newUserReply newUser = await userService.newUser(_currentUser!.email,
                                                            _currentUser!.displayName.toString(),
                                                            _currentUser!.photoUrl.toString());
        }
        UserInfoReply user = await userService.getUserInfo(_currentUser!.email);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              id: _currentUser!.email,
            ),
          ),
        );
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  void changeHideShowPass() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  Future<Null> _login() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            Uri.parse('https://graph.facebook.com/v2.12/me?fields=name,picture.width(800).height(800),first_name,last_name,email&access_token=${token}'));
        final profile = json.decode(graphResponse.body);
        print(profile);
        UserExist isExist = await userService.isExist(profile['email']);
        if (!isExist.isExist) {
          newUserReply newUser = await userService.newUser(profile['email'],
              profile['name'],
              profile['picture']['data']['url']);
        }


        UserInfoReply user = await userService.getUserInfo(profile['email']);

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                      id: profile['email'],
                    )));
        break;
      case FacebookLoginStatus.cancelledByUser:
        _showMessage('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        _showMessage('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  Future<Null> _logOut() async {
    await facebookSignIn.logOut();
    _showMessage('Logged out.');
  }

  void _showMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  void submit(context) async {
    print("email : $email");
    print("password: $password");
    // submit with email and password variables
    // var respone = await accountService.login(email, password);
    // print(respone);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(
                  id: "hailong",
                )));
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
                Container(
                  width: size.width * 0.8,
                  child: RoundedButton(
                      text: "Đăng nhập với FB",
                      onpress: () {
                        _login();
                      }),
                ),
                Container(
                  width: size.width * 0.8,
                  child: RoundedButton(
                      text: "Đăng nhập với GG",
                      onpress: () {
                        _handleSignIn();
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
