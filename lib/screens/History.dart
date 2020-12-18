//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
//import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
//import 'package:remis/screens/account_history.dart';
//import 'package:remis/screens/fueling_history.dart';
//import 'package:remis/screens/subsidy_history.dart';
//
//class HistoryPage extends StatefulWidget {
//  @override
//  _HistoryPageState createState() => _HistoryPageState();
//}
//
//class _HistoryPageState extends State<HistoryPage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Color(0xffF8F8F8),
//      appBar: AppBar(
//        elevation: 0,
//        backgroundColor: Color(0xff1A3365),
//        title: Text(
//          "History",
//          style: TextStyle(
//            fontFamily: "NunitoSemiBold",
//            fontSize: 18,
//          ),
//        ),
//        actions: <Widget>[
//          SvgPicture.asset(
//            "assets/filter.svg",
//            color: Colors.white,
//          )
//        ],
//      ),
//      body: SingleChildScrollView(
//        child: Column(
//          children: <Widget>[
//            Container(
//              height: 290,
//              width: MediaQuery.of(context).size.width,
//              color: Color(0xff1A3365),
//              child: Column(
//                children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
//                    child: Hero(
//                      tag: "date",
//                      child: Container(
//                        decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(20),
//                          color: Colors.white,
//                        ),
//                        child: Padding(
//                          padding: const EdgeInsets.all(12.0),
//                          child: Text(
//                            "15 March, 2020",
//                            style: TextStyle(
//                                fontSize: 15,
//                                fontFamily: "NunitoSemiBold",
//                                color: Color(0xff1A3365)),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                  SizedBox(height: 40),
//                  SvgPicture.asset(
//                    "assets/history.svg",
//                    width: 37,
//                    color: Colors.white,
//                  ),
//                  SizedBox(height: 30),
//                  Text(
//                    "Total Spending",
//                    style: TextStyle(
//                        color: Color(0xffFFBB00),
//                        fontSize: 20,
//                        fontFamily: "Nunito"),
//                  ),
//                  SizedBox(height: 15),
//                  Text(
//                    "500,000.70",
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontFamily: "NunitoSemiBold",
//                        fontSize: 20),
//                  )
//                ],
//              ),
//            ),
//            SizedBox(
//              height: 10,
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                GestureDetector(
//                  onTap: () {
//                    pushNewScreen(context, screen: AccountHistory());
//                  },
//                  child: Card(
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(14)),
//                    color: Color(0xffEBF1FE),
//                    elevation: 1,
//                    child: Container(
//                      height: 162,
//                      width: MediaQuery.of(context).size.width / 2 - 20,
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          SvgPicture.asset(
//                            "assets/gift.svg",
//                            color: Color(0xff1A3365),
//                            width: 66,
//                          ),
//                          SizedBox(
//                            height: 20,
//                          ),
//                          Text(
//                            "VOUCHER HISTORY",
//                            style: TextStyle(
//                                color: Color(0xff1A3365),
//                                fontSize: 13,
//                                fontFamily: "Nunito"),
//                          )
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//                GestureDetector(
//                  onTap: () {
//                    pushNewScreen(context, screen: AccountHistory());
//                  },
//                  child: Card(
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(14)),
//                    color: Color(0xffEBF1FE),
//                    elevation: 1,
//                    child: Container(
//                      height: 162,
//                      width: MediaQuery.of(context).size.width / 2 - 20,
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          SvgPicture.asset(
//                            "assets/moneybig.svg",
//                            color: Color(0xff1A3365),
//                          ),
//                          SizedBox(
//                            height: 20,
//                          ),
//                          Text(
//                            "ACCOUNT HISTORY",
//                            style: TextStyle(
//                                color: Color(0xff1A3365),
//                                fontSize: 13,
//                                fontFamily: "Nunito"),
//                          )
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//            SizedBox(
//              height: 0,
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                GestureDetector(
//                  onTap: () {
//                    pushNewScreen(context, screen: FuelingHistory());
//                  },
//                  child: Card(
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(14)),
//                    color: Color(0xffEBF1FE),
//                    elevation: 1,
//                    child: Container(
//                      height: 162,
//                      width: MediaQuery.of(context).size.width / 2 - 20,
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          SvgPicture.asset(
//                            "assets/fuel.svg",
//                            color: Color(0xff1A3365),
//                          ),
//                          SizedBox(
//                            height: 20,
//                          ),
//                          Text(
//                            "FUELING HISTORY",
//                            style: TextStyle(
//                                color: Color(0xff1A3365),
//                                fontSize: 13,
//                                fontFamily: "Nunito"),
//                          )
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//                GestureDetector(
//                  onTap: () {
//                    pushNewScreen(context, screen: SubsidyHistory());
//                  },
//                  child: Card(
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(14)),
//                    color: Color(0xffEBF1FE),
//                    elevation: 1,
//                    child: Container(
//                      height: 162,
//                      width: MediaQuery.of(context).size.width / 2 - 20,
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          SvgPicture.asset(
//                            "assets/sale.svg",
//                            color: Color(0xff1A3365),
//                          ),
//                          SizedBox(
//                            height: 20,
//                          ),
//                          Text(
//                            "SUBSIDY HISTORY",
//                            style: TextStyle(
//                                color: Color(0xff1A3365),
//                                fontSize: 13,
//                                fontFamily: "Nunito"),
//                          )
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
