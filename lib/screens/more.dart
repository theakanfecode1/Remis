import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:remis/screens/account.dart';
import 'package:remis/screens/custom_alert_dialog.dart';
import 'package:remis/screens/bonus_account.dart';
import 'package:remis/screens/user_profile.dart';
import 'package:remis/screens/voucher.dart';
import 'package:remis/stores/accountloggedinstore.dart';

class More extends StatefulWidget {

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    final loggedInUserStore = Provider.of<AccountLoggedInStore>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff1A3365),
        title: Text(
          "More Options",
          style: TextStyle(fontSize: 18, fontFamily: "NunitoSemiBold"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              color: Color(0xff1A3365),
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Observer(
                builder: (_) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      loggedInUserStore.user.firstName +
                          " " +
                          loggedInUserStore.user.lastName,
                      style: TextStyle(
                          fontFamily: "NunitoBold",
                          fontSize: 25,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      loggedInUserStore.user.email,
                      style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 17,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                    builder: (BuildContext context) => (UserProfile()),
                    maintainState: false)),
                child: Cards(
                  svg: "assets/username-icon.svg",
                  title: "Profile",
                  iconSize: 24,
                )),
            GestureDetector(
                onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                    builder: (BuildContext context) => Account(),
                    maintainState: false)),
                child: Cards(
                  svg: "assets/naira.svg",
                  title: "Account",
                  iconSize: 25,
                )),
            GestureDetector(
                onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                    builder: (BuildContext context) => Voucher(),
                    maintainState: false)),
                child: Cards(
                  svg: "assets/gift.svg",
                  title: "Vouchers",
                  iconSize: 35,
                )),
            GestureDetector(
                onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                    builder: (BuildContext context) => BonusAccount(),
                    maintainState: false)),
                child: Cards(
                  svg: "assets/salehand.svg",
                  title: "Bonus Account",
                  iconSize: 32,
                )),
            GestureDetector(
              onTap: () {

              },
              child: Cards(
                svg: "assets/refer.svg",
                title: "Referral",
                iconSize: 30,
              ),
            ),
            GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0))),
                      builder: (context) => CustomAlertDialog(
                            title: "Log out",
                            message: "You are about to log out of the app",
                            btnText: "Logout",
                          ));
                },
                child: Cards(
                  svg: "assets/logout.svg",
                  title: "Logout",
                  iconSize: 27,
                )),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Terms & Conditions",
                  style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 15,
                      color: Color(0xff1A3365)),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}

class Cards extends StatelessWidget {
  final String svg;
  final String title;
  final double iconSize;

  Cards({this.svg, this.title, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 2, 8, 2),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        child: Padding(
          padding: title == "Logout"
              ? EdgeInsets.all(0)
              : const EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: ListTile(
            leading: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor:
                      title.length == 6 ? Colors.white : Color(0xffDAE3F5),
                  radius: 27,
                ),
                SvgPicture.asset(
                  svg,
                  color: title.length == 6 ? Colors.red : Color(0xff1A3365),
                  width: iconSize,
                )
              ],
            ),
            title: Text(
              title,
              style: TextStyle(
                color: title.length == 6 ? Colors.red : Colors.black,
                fontSize: 16,
                fontFamily: "NunitoSemiBold",
              ),
            ),
            trailing: title.length == 6
                ? null
                : Icon(
                    Icons.arrow_forward,
                    color: Color(0xff515151),
                  ),
          ),
        ),
      ),
    );
  }
}
