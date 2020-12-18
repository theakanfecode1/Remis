import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:remis/screens/loadingScreen.dart';
import 'package:remis/stores/changeprofileorpasswordstore.dart';
import 'package:remis/values/strings/networkcallsmessgaes.dart';

class ManagePassword extends StatefulWidget {
  @override
  _ManagePasswordState createState() => _ManagePasswordState();
}

class _ManagePasswordState extends State<ManagePassword> {
  TextEditingController _oldPassword = TextEditingController();
  TextEditingController _newPassword = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  void updateProfile(
      String oldPassword, String newPassword, String confirmPassword) async {
    final updateStore = Provider.of<ChangeProfileOrPasswordStore>(context);
    String result = await updateStore.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword);
    if(result == NetworkCallsMessages.successful){
      Fluttertoast.showToast(msg: "Successful password change");

    }else{
      Fluttertoast.showToast(msg: result);
    }
    Navigator.of(context,rootNavigator: true).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Manage Password",
          style: TextStyle(fontSize: 18, fontFamily: "MontserratSemiBold"),
        ),
        backgroundColor: Color(0xff1A3365),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffF8F8F8),
          constraints: BoxConstraints.expand(height: 600),
          child: Stack(
            children: <Widget>[
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff1A3365),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 130, top: 50),
                  child: SvgPicture.asset(
                    "assets/forgot.svg",
                    color: Colors.white,
                    width: 50,
                  ),
                ),
              ),
              Positioned(
                top: 200,
                left: 20,
                right: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 280,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              height: double.infinity,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffF3F3F3),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(70),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
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
                                                10, 10, 10, 10),
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
                                              controller: _oldPassword,
                                              style: TextStyle(
                                                  fontFamily: 'Nunito',
                                                  color: Colors.grey[600]),
                                              decoration: InputDecoration(
                                                focusedBorder: InputBorder.none,
                                                border: InputBorder.none,
                                                hintText: "Old Password",
                                                hoverColor: Colors.red,
                                                hintStyle: TextStyle(
                                                  fontFamily: 'Nunito',
                                                ),
                                              ),
                                              textInputAction:
                                                  TextInputAction.next,
                                              obscureText: true,
                                              onSubmitted: (_) {
                                                FocusScope.of(context)
                                                    .nextFocus();
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
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
                                                10, 10, 10, 10),
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
                                              controller: _newPassword,
                                              style: TextStyle(
                                                  fontFamily: 'Nunito',
                                                  color: Colors.grey[600]),
                                              decoration: InputDecoration(
                                                focusedBorder: InputBorder.none,
                                                border: InputBorder.none,
                                                hintText: "New Password",
                                                hoverColor: Colors.red,
                                                hintStyle: TextStyle(
                                                  fontFamily: 'Nunito',
                                                ),
                                              ),
                                              textInputAction:
                                                  TextInputAction.done,
                                              obscureText: true,
                                              onSubmitted: (_) {
                                                FocusScope.of(context)
                                                    .nextFocus();
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
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
                                                10, 10, 10, 10),
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
                                              controller: _confirmPassword,
                                              style: TextStyle(
                                                  fontFamily: 'Nunito',
                                                  color: Colors.grey[600]),
                                              decoration: InputDecoration(
                                                focusedBorder: InputBorder.none,
                                                border: InputBorder.none,
                                                hintText: "Confirm Password",
                                                hoverColor: Colors.red,
                                                hintStyle: TextStyle(
                                                  fontFamily: 'Nunito',
                                                ),
                                              ),
                                              textInputAction:
                                                  TextInputAction.done,
                                              obscureText: true,
                                              onSubmitted: (_) {
                                                Navigator.of(context,rootNavigator: true).push(LoadingScreen.showLoadingScreen("Changing password..."));
                                                updateProfile(
                                                    _oldPassword.text,
                                                    _newPassword.text,
                                                    _confirmPassword.text);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      height: 45,
                                      child: RaisedButton(
                                        onPressed: () {
                                          Navigator.of(context,rootNavigator: true).push(LoadingScreen.showLoadingScreen("Changing password..."));
                                          updateProfile(
                                              _oldPassword.text,
                                              _newPassword.text,
                                              _confirmPassword.text);
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        color: Color(0xff1A3365),
                                        child: (Text(
                                          "Update Password",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Nunito",
                                              fontSize: 20),
                                        )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _oldPassword.dispose();
    _newPassword.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }
}
