import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FuelAmount extends StatefulWidget {
  @override
  _FuelAmountState createState() => _FuelAmountState();
}

class _FuelAmountState extends State<FuelAmount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Fuel Amount",
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
                  padding: const EdgeInsets.only(bottom: 140, top: 60),
                  child: SvgPicture.asset(
                    "assets/money.svg",
                    color: Colors.white,
                    width: 30,
                  ),
                ),
              ),
              Positioned(
                top: 200,
                left: 20,
                right: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
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
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text(
                            "How much do you want to Fuel?",
                            maxLines: 2,
                            style: TextStyle(
                                color: Color(0xff1A3365), fontFamily: "Nunito"),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Stack(
                          overflow: Overflow.visible,
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            Container(
                              height: 250,
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
                                                  radius: 14.0,
                                                  backgroundColor:
                                                      Color(0xffE6EFFF),
                                                ),
                                                SvgPicture.asset(
                                                  'assets/naira.svg',
                                                  width: 15,
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
                                              decoration: InputDecoration(
                                                focusedBorder: InputBorder.none,
                                                border: InputBorder.none,
                                                hintText: "Enter amount",
                                                hoverColor: Colors.red,
                                                hintStyle: TextStyle(
                                                  fontFamily: 'Nunito',
                                                ),
                                              ),
                                              textInputAction:
                                                  TextInputAction.done,
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
                                      height: 50,
                                      child: RaisedButton(
                                        onPressed: () {},
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        color: Color(0xff1A3365),
                                        child: (Text(
                                          "Proceed",
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
}
