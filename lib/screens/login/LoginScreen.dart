import 'package:flutter/material.dart';
import 'package:frontend/component/AccountService.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/generated/userInfo/user_info.pb.dart';
import 'package:frontend/screens/components/CircleChessBackground.dart';
import 'package:frontend/screens/components/RoundedButton.dart';
import 'package:frontend/screens/components/WelcomeBackground.dart';
import 'package:frontend/screens/home/HomeScreen.dart';
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
    bool result = false;
    try {
      await _googleSignIn.signIn();
      if (_currentUser != null) {
        UserExist isExist = await userService.isExist(_currentUser!.email);
        if (!isExist.isExist) {
          newUserReply newUser = await userService.newUser(
              _currentUser!.email,
              _currentUser!.displayName.toString(),
              _currentUser!.photoUrl.toString());
        }
        UserInfoReply user = await userService.getUserInfo(_currentUser!.email);
        result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              id: _currentUser!.email,
            ),
          ),
        );
      }
      if (result) {
        try {
          LogoutReply logout = await userService.logout(_currentUser!.email);
        } catch (e) {
          print(e);
        }
        _googleSignIn.signOut();
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Future<Null> _login() async {
    bool isLogout = false;
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        final token = result.accessToken.token;
        final graphResponse = await http.get(Uri.parse(
            'https://graph.facebook.com/v2.12/me?fields=name,picture.width(800).height(800),first_name,last_name,email&access_token=${token}'));
        final profile = json.decode(graphResponse.body);
        print(profile);
        UserExist isExist = await userService.isExist(profile['email']);
        if (!isExist.isExist) {
          newUserReply newUser = await userService.newUser(profile['email'],
              profile['name'], profile['picture']['data']['url']);
        }

        UserInfoReply user = await userService.getUserInfo(profile['email']);

        isLogout = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                      id: profile['email'],
                    )));
        if (isLogout) {
          LogoutReply logout = await userService.logout(profile['email']);
          facebookSignIn.logOut();
        }
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
    if (mounted)
      setState(() {
        _message = message;
      });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: WelcomeBackground(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Container(
            alignment: Alignment.center,
            height: size.height,
            width: size.width,
            color: bg_transpearent,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  Container(
                    width: size.width * 0.8,
                    child: RoundedButton(
                        text: "Đăng nhập với FB",
                        onpress: () {
                          _login();
                        }),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
