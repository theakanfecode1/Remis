import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AddFund extends StatefulWidget {
  @override
  _AddFundState createState() => _AddFundState();
}

class _AddFundState extends State<AddFund> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Add Funds",
          style: TextStyle(fontSize: 18, fontFamily: "MontserratSemiBold"),
        ),
        backgroundColor: Color(0xff1A3365),
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
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
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Card(
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 15, 10, 15),
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
                                            focusedBorder: InputBorder.none,
                                            border: InputBorder.none,
                                            hintText: "0.00",
                                            hoverColor: Colors.red,
                                            hintStyle: TextStyle(
                                              fontFamily: 'Nunito',
                                            ),
                                          ),
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.done,
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
                                        borderRadius: BorderRadius.circular(8)),
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
            ),
          ),
        ),
      ),
    );
  }
}
