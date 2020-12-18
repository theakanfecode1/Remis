import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:remis/screens/ordervolume.dart';

class DieselDelivery extends StatefulWidget {
  @override
  _DieselDeliveryState createState() => _DieselDeliveryState();
}

class _DieselDeliveryState extends State<DieselDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Manage orders",
          style: TextStyle(fontSize: 18, fontFamily: "MontserratSemiBold"),
        ),
        backgroundColor: Color(0xff1A3365),
        actions: <Widget>[
          IconButton(
              icon: SvgPicture.asset(
                "assets/filter.svg",
                color: Colors.white,
              ),
              onPressed: null)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffF8F8F8),
          constraints: BoxConstraints.expand(height: 730),
          child: Stack(
            children: <Widget>[
              Container(
                height: 220,
                alignment: Alignment.topCenter,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff1A3365),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/order.png",
                        height: 65,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "0",
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: "Nunito",
                              color: Color(0xffFFBB00)),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Orders",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Nunito",
                              color: Color(0xffFFBB00)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (BuildContext context) =>
                                  OrderVolume(),
                              maintainState: false));
                        },
                        color: Color(0xff081736),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        icon: SvgPicture.asset(
                          "assets/plus.svg",
                          color: Colors.white,
                        ),
                        label: Text(
                          "New Order",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Nunito",
                              color: Color(0xffFFFFFF)),
                        ))
                  ],
                ),
              ),
              Positioned(
                top: 200,
                left: 20,
                right: 20,
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 519,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xffFFFFFF)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/tool.png",
                        height: 70,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "You have no order, make new order.",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Nunito",
                            color: Color(0xffB4B4B4)),
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
