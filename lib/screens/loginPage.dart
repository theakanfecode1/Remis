import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:remis/screens/loadingScreen.dart';
import 'package:remis/screens/customDivider.dart';
import 'package:remis/screens/texterrorwidget.dart';
import 'dart:async';
import 'package:remis/stores/accountloggedinstore.dart';
import 'package:remis/values/strings/networkcallsmessgaes.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool showPassword = true;
  bool usernameError = true;
  bool passwordError = true;
  bool firstLaunch = false;
  String userName = "";
  TextEditingController _passWordController = TextEditingController();
  String password = "";

  Future loginUser(String username, String password) async {
    final provider = Provider.of<AccountLoggedInStore>(context);
    String result = await provider.setUserData(username: username, password: password);
    Navigator.of(context).pop();
    //        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Fluttertoast.showToast(
        msg: result,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        backgroundColor: Colors.black);
    if(result == NetworkCallsMessages.successful){
      Navigator.popAndPushNamed(context, '/controller');
    }
  }

  @override
  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//      statusBarColor: Color(0xff1A3365),
//      statusBarIconBrightness: Brightness.light,
//      statusBarBrightness: Brightness.light,
//    ));
    return Scaffold(
      backgroundColor: Color(0xff1A3365),
      body: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 350.0,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: <Widget>[
                      ClipPath(
                        clipper: MyClipper(),
                        child: Container(
                          height: 350.0,
                          decoration: BoxDecoration(
                            color: Color(0xffF3F3F3),
                          ),
                        ),
                      ),
                      ClipPath(
                        clipper: MyClipper(),
                        child: Container(
                          height: 80.0,
                          width: 110.0,
                          decoration: BoxDecoration(color: Color(0xff1A3365)),
                        ),
                      ),
                      Positioned(
                        top: 80.0,
                        left: 5.0,
                        right: 5.0,
                        child: SvgPicture.asset(
                          'assets/remislogo.svg',
                          color: Color(0xff1A3365),
                          semanticsLabel: 'Remis',
                        ),
                      ),
                      Positioned(
                        top: 200,
                        left: 5,
                        right: 5,
                        child: Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Card(
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9.0),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 15, 10, 15),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        CircleAvatar(
                                          radius: 13.0,
                                          backgroundColor: Color(0xffE6EFFF),
                                        ),
                                        SvgPicture.asset(
                                          'assets/username-icon.svg',
                                          color: Color(0xff1A3365),
                                        )
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: TextFormField(
                                      style: TextStyle(
                                          fontFamily: 'Nunito',
                                          color: Colors.grey[600]),
                                      decoration: InputDecoration(
                                        focusedBorder: InputBorder.none,
                                        border: InputBorder.none,
                                        hintText: "Username",
                                        suffixIcon: usernameError
                                            ? Icon(
                                                Icons.error,
                                                color: Colors.red,
                                              )
                                            : null,
                                        hoverColor: Colors.red,
                                        hintStyle: TextStyle(
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                      onChanged: (text) {
                                        setState(() {
                                          userName = text;
                                          if (text.isEmpty || text == null) {
                                            usernameError = true;
                                          } else {
                                            usernameError = false;
                                          }
                                        });
                                      },
                                      onFieldSubmitted: (text) {
                                        userName = text;
                                        FocusScope.of(context).nextFocus();
                                        if (text.isEmpty || text == null) {
                                          setState(() {
                                            usernameError = true;
                                          });
                                        } else {
                                          setState(() {
                                            usernameError = false;
                                          });
                                        }
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 270,
                        left: 5,
                        right: 5,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Card(
                            elevation: 3.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9.0),
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 13.0,
                                        backgroundColor: Color(0xffE6EFFF),
                                      ),
                                      SvgPicture.asset(
                                        'assets/password-icon.svg',
                                        color: Color(0xff1A3365),
                                      )
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Form(
                                    child: TextFormField(
                                      controller: _passWordController,
                                      onChanged: (text) {
                                        password = text;
                                        firstLaunch = true;
                                        if (text.length < 6) {
                                          setState(() {
                                            passwordError = true;
                                          });
                                        } else {
                                          setState(() {
                                            passwordError = false;
                                          });
                                        }
                                      },
                                      style: TextStyle(
                                          fontFamily: 'Nunito',
                                          color: Colors.grey[600]),
                                      decoration: InputDecoration(
                                        focusedBorder: InputBorder.none,
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              showPassword = !showPassword;
                                            });
                                          },
                                          child: Icon(
                                            showPassword
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        hoverColor: Colors.red,
                                        hintStyle: TextStyle(
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                      textInputAction: TextInputAction.done,
                                      onFieldSubmitted:
                                          !usernameError && !passwordError
                                              ? (text) async {
                                            Navigator.of(context).push(LoadingScreen.showLoadingScreen("Signing In"));

                                            await loginUser(
                                                      userName, password);
                                                }
                                              : (text) {
                                                  password = text;
                                                },
                                      obscureText: showPassword,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (usernameError)
                        Positioned(
                            top: 245,
                            right: 5,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 24.0),
                              child: ErrorPrompt("Not a valid username"),
                            )),
                      if (passwordError && firstLaunch)
                        Positioned(
                            top: 300,
                            right: 5,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 24.0),
                              child: ErrorPrompt(
                                  "Minimum password length must be six"),
                            )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25, left: 22, right: 22),
                  child: SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: RaisedButton(
                      onPressed: !usernameError && !passwordError
                          ? () async {
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).push(LoadingScreen.showLoadingScreen("Signing In"));
                        await loginUser(userName, password);

                      }
                          : null,
                      disabledColor: Color(0x4D1A3365),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Nunito",
                            fontSize: 20.0),
                      ),
                      color: usernameError && passwordError
                          ? Color(0x4D1A3365)
                          : Color(0xff1A3365),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Icon(
                  Icons.fingerprint,
                  size: 50,
                ),
                SizedBox(
                  height: 10.0,
                ),
                HorizontalOrLine(height: 10, label: "OR"),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Sign in with",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 18,
                      color: Color(0xffA2A1A2)),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage("assets/facebookpng.png"),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage("assets/twitterpng.png"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          color: Color(0xffA2A1A2),
                          fontSize: 18,
                          fontFamily: 'Montserrat'),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/signup');
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff1A3365),
                            fontFamily: "NunitoSemiBold"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height - 150);
    path.quadraticBezierTo(0, size.height, 150, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class LoginDetails {
  final String username;
  final String password;

  LoginDetails({this.username, this.password});

  factory LoginDetails.fromJson(Map<String, dynamic> json) {
    return LoginDetails(username: json["userName"], password: json["password"]);
  }
}
