import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:remis/screens/customDivider.dart';
import 'package:remis/screens/loadingScreen.dart';
import 'package:remis/screens/texterrorwidget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:remis/stores/signupstore.dart';
import 'package:remis/values/strings/networkcallsmessgaes.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool usernameError = true;
  bool passwordError = true;
  bool showPassword = false;
  bool firstLauch = false;

  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _referral = TextEditingController();

  Future registerUser(String username, String password, String firstname,
      String lastname, String referralcode, String phone) async {
    final signUpStore = Provider.of<SignUpStore>(context);
    String result = await signUpStore.setUserData(
        username: username,
        password: password,
        firstName: firstname,
        lastName: lastname,
        referralCode: referralcode,
        phone: phone);
    Navigator.of(context,rootNavigator: true).pop();
    Fluttertoast.showToast(
        msg: result,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        backgroundColor: Colors.black);
    if (result == NetworkCallsMessages.successful) {
      Fluttertoast.showToast(
          msg: "Account created,check your email for verification link.",
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          backgroundColor: Colors.black);
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _phoneNumber.dispose();
    _referral.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Scaffold(
        backgroundColor: Color(0xff1A3365),
        body: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                            child: SvgPicture.asset(
                              'assets/remislogo.svg',
                              color: Color(0xff1A3365),
                            ),
                          ),
                          ClipPath(
                            clipper: CornerCurve(),
                            child: Container(
                              width: 100,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Color(0xff1A3365),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 44,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(150)),
                            color: Color(0xffF3F3F3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Card(
                                    elevation: 3.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              10, 13, 10, 13),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: <Widget>[
                                              CircleAvatar(
                                                radius: 13.0,
                                                backgroundColor:
                                                    Color(0xffE6EFFF),
                                              ),
                                              SvgPicture.asset(
                                                'assets/username-icon.svg',
                                                color: Color(0xff1A3365),
                                              )
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          child: TextField(
                                            controller: _firstName,
                                            style: TextStyle(
                                                fontFamily: 'Nunito',
                                                color: Colors.grey[600]),
                                            decoration: InputDecoration(
                                              focusedBorder: InputBorder.none,
                                              border: InputBorder.none,
                                              hintText: "First Name",
                                              hoverColor: Colors.red,
                                              hintStyle: TextStyle(
                                                fontFamily: 'Nunito',
                                              ),
                                            ),
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            onSubmitted: (text) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Card(
                                    elevation: 3.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              10, 13, 10, 13),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: <Widget>[
                                              CircleAvatar(
                                                radius: 13.0,
                                                backgroundColor:
                                                    Color(0xffE6EFFF),
                                              ),
                                              SvgPicture.asset(
                                                'assets/username-icon.svg',
                                                color: Color(0xff1A3365),
                                              )
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          child: TextField(
                                            controller: _lastName,
                                            style: TextStyle(
                                                fontFamily: 'Nunito',
                                                color: Colors.grey[600]),
                                            decoration: InputDecoration(
                                              focusedBorder: InputBorder.none,
                                              border: InputBorder.none,
                                              hintText: "Last Name",
                                              hoverColor: Colors.red,
                                              hintStyle: TextStyle(
                                                fontFamily: 'Nunito',
                                              ),
                                            ),
                                            onSubmitted: (text) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            },
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Stack(
                                  alignment: Alignment.bottomRight,
                                  overflow: Overflow.visible,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: Card(
                                        elevation: 3.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(9.0),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 13, 10, 13),
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: <Widget>[
                                                  CircleAvatar(
                                                    radius: 13.0,
                                                    backgroundColor:
                                                        Color(0xffE6EFFF),
                                                  ),
                                                  SvgPicture.asset(
                                                    'assets/email.svg',
                                                    color: Color(0xff1A3365),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Flexible(
                                              child: TextField(
                                                controller: _email,
                                                style: TextStyle(
                                                    fontFamily: 'Nunito',
                                                    color: Colors.grey[600]),
                                                decoration: InputDecoration(
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  border: InputBorder.none,
                                                  suffixIcon: usernameError
                                                      ? Icon(
                                                          Icons.error,
                                                          color: Colors.red,
                                                          size: 18,
                                                        )
                                                      : null,
                                                  hintText: "Email",
                                                  hoverColor: Colors.red,
                                                  hintStyle: TextStyle(
                                                    fontFamily: 'Nunito',
                                                  ),
                                                ),
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                textInputAction:
                                                    TextInputAction.next,
                                                onChanged: (text) {
                                                  setState(() {
                                                    if (text.isEmpty ||
                                                        text == null) {
                                                      usernameError = true;
                                                    } else {
                                                      usernameError = false;
                                                    }
                                                  });
                                                },
                                                onSubmitted: (text) {
                                                  FocusScope.of(context)
                                                      .nextFocus();
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (usernameError)
                                      Positioned(
                                          top: 29,
                                          right: 29,
                                          child: ErrorPrompt(
                                              "Not a valid username")),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Card(
                                    elevation: 3.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              10, 13, 10, 13),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: <Widget>[
                                              CircleAvatar(
                                                radius: 13.0,
                                                backgroundColor:
                                                    Color(0xffE6EFFF),
                                              ),
                                              SvgPicture.asset(
                                                'assets/phone.svg',
                                                color: Color(0xff1A3365),
                                              )
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          child: TextField(
                                            controller: _phoneNumber,
                                            style: TextStyle(
                                                fontFamily: 'Nunito',
                                                color: Colors.grey[600]),
                                            decoration: InputDecoration(
                                              focusedBorder: InputBorder.none,
                                              border: InputBorder.none,
                                              hintText: "Phone Number",
                                              hoverColor: Colors.red,
                                              hintStyle: TextStyle(
                                                fontFamily: 'Nunito',
                                              ),
                                            ),
                                            keyboardType: TextInputType.phone,
                                            textInputAction:
                                                TextInputAction.next,
                                            onSubmitted: (text) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Card(
                                        elevation: 3.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(9.0),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 13, 10, 13),
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: <Widget>[
                                                  CircleAvatar(
                                                    radius: 13.0,
                                                    backgroundColor:
                                                        Color(0xffE6EFFF),
                                                  ),
                                                  SvgPicture.asset(
                                                    'assets/password-icon.svg',
                                                    color: Color(0xff1A3365),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Flexible(
                                              child: TextField(
                                                controller: _password,
                                                style: TextStyle(
                                                    fontFamily: 'Nunito',
                                                    color: Colors.grey[600]),
                                                decoration: InputDecoration(
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  border: InputBorder.none,
                                                  hintText: "Password",
                                                  hoverColor: Colors.red,
                                                  suffixIcon: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        showPassword =
                                                            !showPassword;
                                                      });
                                                    },
                                                    child: !showPassword
                                                        ? Icon(
                                                            Icons
                                                                .visibility_off,
                                                            color: Colors
                                                                .grey[600],
                                                          )
                                                        : Icon(Icons.visibility,
                                                            color: Colors
                                                                .grey[600]),
                                                  ),
                                                  hintStyle: TextStyle(
                                                    fontFamily: 'Nunito',
                                                  ),
                                                ),
                                                obscureText: !showPassword
                                                    ? true
                                                    : false,
                                                textInputAction:
                                                    TextInputAction.next,
                                                onChanged: (text) {
                                                  firstLauch = true;
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
                                                onSubmitted: (text) {
                                                  firstLauch = true;
                                                  FocusScope.of(context)
                                                      .nextFocus();
                                                  if (text.isEmpty ||
                                                      text == null) {
                                                    setState(() {
                                                      passwordError = true;
                                                    });
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (passwordError && firstLauch)
                                      Positioned(
                                          top: 10,
                                          right: 5,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 24.0),
                                            child: ErrorPrompt(
                                                "Minimum password length must be six"),
                                          )),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Card(
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              10, 13, 10, 13),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: <Widget>[
                                              CircleAvatar(
                                                radius: 13.0,
                                                backgroundColor:
                                                    Color(0xffE6EFFF),
                                              ),
                                              SvgPicture.asset(
                                                'assets/password-icon.svg',
                                                color: Color(0xff1A3365),
                                              )
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          child: TextField(
                                            controller: _referral,
                                            style: TextStyle(
                                                fontFamily: 'Nunito',
                                                color: Colors.grey[600]),
                                            decoration: InputDecoration(
                                              focusedBorder: InputBorder.none,
                                              border: InputBorder.none,
                                              hintText: "Referral Code",
                                              hoverColor: Colors.red,
                                              hintStyle: TextStyle(
                                                fontFamily: 'Nunito',
                                              ),
                                            ),
                                            obscureText: true,
                                            textInputAction:
                                                TextInputAction.done,
                                            onSubmitted: (text){
                                              FocusScope.of(context).unfocus();
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .push(LoadingScreen
                                                      .showLoadingScreen(
                                                          "Signing Up...."));
                                              registerUser(
                                                  _email.text,
                                                  _password.text,
                                                  _firstName.text,
                                                  _lastName.text,
                                                  _referral.text,
                                                  _phoneNumber.text);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  width: 300,
                                  height: 60,
                                  child: RaisedButton(
                                    onPressed: !usernameError && !passwordError
                                        ? () async {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .push(LoadingScreen
                                                    .showLoadingScreen(
                                                        "Signing Up...."));

                                            registerUser(
                                                _email.text,
                                                _password.text,
                                                _firstName.text,
                                                _lastName.text,
                                                _referral.text,
                                                _phoneNumber.text);
                                          }
                                        : null,
                                    disabledColor: Color(0x4D1A3365),
                                    color: !usernameError && !passwordError
                                        ? Color(0xff1A3365)
                                        : Color(0x4D1A3365),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text(
                                      "SIGN UP",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: "Nunito"),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                HorizontalOrLine(
                                  height: 10,
                                  label: "OR",
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 12,
                                      backgroundImage:
                                          AssetImage("assets/facebookpng.png"),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    CircleAvatar(
                                      radius: 12,
                                      backgroundImage:
                                          AssetImage("assets/twitterpng.png"),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Already have an account?",
                                      style: TextStyle(
                                          color: Color(0xffA2A1A2),
                                          fontSize: 18,
                                          fontFamily: 'Montserrat'),
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(
                                            context, '/login');
                                      },
                                      child: Text(
                                        "Sign in",
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class CornerCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 120);
    path.quadraticBezierTo(0, size.height, 110, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
