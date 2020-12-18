import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:remis/screens/account_upgrade.dart';
import 'package:remis/stores/accountloggedinstore.dart';

class Account extends StatefulWidget {

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loggedInUser = Provider.of<AccountLoggedInStore>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff1A3365),
        title: Text(
          "Account",
          style: TextStyle(fontSize: 18, fontFamily: "NunitoSemiBold"),
        ),
      ),
      body: SingleChildScrollView(
        child: Observer(
          builder:(_) => Column(
            children: <Widget>[
              ProfileCards("Mobile Number", loggedInUser.user.phoneNumber),
              ProfileCards("BVN", "BVN not linked"),
              GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0))),
                      builder: (context) => Container(
                        height: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            SvgPicture.asset(
                              "assets/money.svg",
                              color: Color(0xff1A3365),
                              width: 50,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Flexible(
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xffF3F3F3),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(70),
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Card(
                                          elevation: 3.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 15, 10, 15),
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: <Widget>[
                                                    CircleAvatar(
                                                      radius: 19.0,
                                                      backgroundColor:
                                                          Color(0xffE6EFFF),
                                                    ),
                                                    SvgPicture.asset(
                                                      'assets/money.svg',
                                                      width: 20,
                                                      color: Color(0xff1A3365),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontFamily: 'Nunito',
                                                      color: Colors.grey[600]),
                                                  showCursor: false,
                                                  decoration: InputDecoration(
                                                    focusColor: Colors.white,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    border: InputBorder.none,
                                                    hintText: "0.00",
                                                    hoverColor: Colors.red,
                                                    hintStyle: TextStyle(
                                                      fontFamily: 'Nunito',
                                                    ),
                                                  ),
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  textInputAction:
                                                      TextInputAction.done,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        SizedBox(
                                          height: 58,
                                          child: RaisedButton(
                                            onPressed: () {},
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            color: Color(0xff1A3365),
                                            child: (Text(
                                              "Add Funds",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Nunito",
                                                  fontSize: 20),
                                            )),
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
                    );
                  },
                  child: ProfileCards("Daily Transaction Limit", "20,000.00")),
              GestureDetector(
                  onTap: () => pushNewScreen(context, screen: AccountUpgrade()),
                  child: Direction("Account Upgrade")),
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
