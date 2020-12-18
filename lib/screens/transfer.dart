import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:remis/screens/transfer_details.dart';

class Transfer extends StatefulWidget {
  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Transfer",
          style: TextStyle(fontSize: 18, fontFamily: "MontserratSemiBold"),
        ),
        backgroundColor: Color(0xff1A3365),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffF8F8F8),
          constraints: BoxConstraints.expand(height: 440),
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
                  child: Hero(
                    tag: "transfer",
                    child: SvgPicture.asset(
                      "assets/transfer.svg",
                      color: Colors.white,
                      width: 50,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 150,
                left: MediaQuery.of(context).size.width / 2 - 100,
                right: MediaQuery.of(context).size.width / 2 - 100,
                child: Text(
                  "Where would you like to transfer to?",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "MontserratMedium",
                      fontSize: 10),
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
                      color: Color(0xffF3F3F3)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 25.0,
                                      backgroundColor: Color(0xff1A3365),
                                    ),
                                    SvgPicture.asset(
                                      'assets/smallremis.svg',
                                      width: 25,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                ("Remis Transfer"),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "NunitoSemiBold",
                                    color: Color(0xff1A3365)),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Color(0xff1A3365),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10))),
                                width: 10,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () =>
                              pushNewScreen(context, screen: TransferDetails()),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 25.0,
                                        backgroundColor: Color(0xff1A3365),
                                      ),
                                      SvgPicture.asset(
                                        'assets/bank.svg',
                                        width: 25,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  ("Bank Transfer"),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "NunitoSemiBold",
                                      color: Color(0xff1A3365)),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Color(0xff1A3365),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10))),
                                  width: 10,
                                )
                              ],
                            ),
                          ),
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
    );
  }
}
//ListTile(
//leading: Container(
//height: double.infinity,
//width: 5,
//color: Color(0xff1A3365),
//),
//trailing: Icon(Icons.arrow_forward,color: Color(0xff1A3365),),
//),
