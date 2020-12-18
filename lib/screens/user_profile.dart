import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:remis/screens/managepassword.dart';
import 'package:remis/screens/setup_pin.dart';
import 'package:remis/screens/updateprofile.dart';
import 'package:remis/stores/accountloggedinstore.dart';

class UserProfile extends StatefulWidget {

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  @override
  Widget build(BuildContext context) {
    final loggedInUser = Provider.of<AccountLoggedInStore>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff1A3365),
        title: Text(
          "User Profile",
          style: TextStyle(fontSize: 18, fontFamily: "NunitoSemiBold"),
        ),
      ),
      body: SingleChildScrollView(
        child: Observer(
          builder:(_) => Column(
            children: <Widget>[
              ProfileCards("Full Name", loggedInUser.user.firstName + " " + loggedInUser.user.lastName),
              ProfileCards("Email", loggedInUser.user.email),
              GestureDetector(
                  onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                      builder: (BuildContext context) => (ManagePassword()),
                      maintainState: false)),
                  child: Direction("Manage Password")),
              GestureDetector(
                  onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                      builder: (BuildContext context) => (SetUpPin()),
                      maintainState: false)),
                  child: Direction("Manage Pin")),
              GestureDetector(
                  onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                      builder: (BuildContext context) => (UpdateProfile()),
                      maintainState: false)),
                  child: Direction("Update Profile")),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCards extends StatelessWidget {
  final String title;
  final String message;

  ProfileCards(this.title, this.message);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 5),
              Text(
                title,
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 13,
                    fontFamily: "MontserratMedium"),
              ),
              SizedBox(height: 5),
              Text(
                message,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: "MontserratMedium"),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}

class Direction extends StatelessWidget {
  final String title;

  Direction(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: "MontserratMedium"),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
