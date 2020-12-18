import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:remis/database/Database.dart';
import 'package:remis/screens/loadingScreen.dart';
import 'package:remis/stores/accountloggedinstore.dart';
import 'package:remis/stores/changeprofileorpasswordstore.dart';
import 'package:remis/utils/account/accountlogin.dart';
import 'package:remis/values/strings/networkcallsmessgaes.dart';

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  void updateProfile(
      String firstName, String lastName, String phoneNumber) async {
    final updateStore = Provider.of<ChangeProfileOrPasswordStore>(context);
    String result = await updateStore.changeProfile(
        firstName: firstName, lastName: lastName, phoneNumber: phoneNumber);
    if(result == NetworkCallsMessages.successful){
      Fluttertoast.showToast(msg: "Successful profile");

    }else{
      Fluttertoast.showToast(msg: result);
    }
    Navigator.of(context,rootNavigator: true).pop();

  }
  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    phoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getProfile();
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Edit Profile",
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
                    "assets/conversation.svg",
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
                  height: 300,
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
                          alignment: Alignment.topCenter,
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
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                                                  'assets/username-icon.svg',
                                                  color: Color(0xff1A3365),
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: TextField(
                                              controller: firstName,
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                                                  'assets/username-icon.svg',
                                                  color: Color(0xff1A3365),
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: TextField(
                                              controller: lastName,
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
                                              keyboardType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.next,
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                                                  'assets/phone.svg',
                                                  color: Color(0xff1A3365),
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: TextField(
                                              controller: phoneNumber,
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
                                                  TextInputAction.done,
                                              onSubmitted: (_) {
                                                Navigator.of(context,rootNavigator: true).push(LoadingScreen.showLoadingScreen("Updating Profile..."));
                                                updateProfile(
                                                    firstName.text,
                                                    lastName.text,
                                                    phoneNumber.text);
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
                                          Navigator.of(context,rootNavigator: true).push(LoadingScreen.showLoadingScreen("Updating Profile..."));
                                          updateProfile(firstName.text,
                                              lastName.text, phoneNumber.text);
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        color: Color(0xff1A3365),
                                        child: (Text(
                                          "Update Profile",
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
  void initState() {
    super.initState();
  }

  void getProfile() async {
    final loggedInUser = Provider.of<AccountLoggedInStore>(context);
    firstName.text = loggedInUser.user.firstName;
    lastName.text = loggedInUser.user.lastName;
    phoneNumber.text = loggedInUser.user.phoneNumber;
  }
}
