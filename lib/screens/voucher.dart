

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:remis/utils/vouchers.dart';

class Voucher extends StatefulWidget {
  @override
  _VoucherState createState() => _VoucherState();
}

class _VoucherState extends State<Voucher> {
  var tap = true;
  List<Vouchers> vouchers = [
    Vouchers(
        id: "23456",
        location: "Lagos",
        amount: "10,000",
        date: "22 march 2020"),
    Vouchers(
        id: "23456",
        location: "Lagos",
        amount: "10,000",
        date: "22 march 2020"),
    Vouchers(
        id: "23456",
        location: "Lagos",
        amount: "10,000",
        date: "22 march 2020"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color(0xff1A3365),
        title: Text(
          "Vouchers",
          style: TextStyle(
            fontFamily: "NunitoSemiBold",
            fontSize: 18,
          ),
        ),
        actions: <Widget>[
          SvgPicture.asset(
            "assets/filter.svg",
            color: Colors.white,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 161,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xff1A3365),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
//                    backgroundImage: SvgPicture.asset("assets/history.svg"),
                      ),
                      SvgPicture.asset(
                        "assets/gift.svg",
                        width: 40,
                        color: Color(0xff1A3365),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton.icon(
                        onPressed: () {},
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        icon: SvgPicture.asset(
                          "assets/plus.svg",
                          color: Colors.white,
                        ),
                        color: Color(0xff081736),
                        label: Text(
                          "Create Voucher",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: "Nunito"),
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {},
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: Color(0xffFFBB00),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Consume Voucher",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontFamily: "Nunito"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap:(){
                        setState(() {
                          tap = true;
                        });
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration:BoxDecoration(
                          color: tap ? Color(0xff1A3365) : Colors.white,
                          borderRadius: BorderRadius.circular(50)
                        ),

                        child: Text(
                          "Unused",
                          style: TextStyle(
                              color: tap ? Colors.white : Color(0xff1A3365),
                              fontFamily: "Nunito"),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap:(){
                        setState(() {
                          tap = false;
                        });
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration:BoxDecoration(
                            color: tap ? Colors.white : Color(0xff1A3365),
                            borderRadius: BorderRadius.circular(50)
                        ),

                        child: Text(
                          "Used",
                          style: TextStyle(
                              color: tap ? Color(0xff1A3365) : Colors.white,
                              fontFamily: "Nunito"),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: vouchers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left:8.0,right: 8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)
                      ),
                      elevation: 0,
                      child: ListTile(
                        title: Text(vouchers[index].id,
                        style: TextStyle(
                            color: Color(0xff1A3365),
                            fontSize: 15,
                            fontFamily: "NunitoSemiBold"
                        ),),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(vouchers[index].location,
                          style: TextStyle(
                              color: Color(0xff515151),
                              fontSize: 15,
                              fontFamily: "Nunito"
                          ),),
                        ),
                        leading: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Color(0xffDAE3F5),
                              radius: 20,
                            ),
                            SvgPicture.asset("assets/gift.svg",
                              color: Color(0xff1A3365),
                              width: 30,)
                          ],
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(vouchers[index].amount,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 13,
                              fontFamily: "NunitoSemiBold"
                            ),),
                            SizedBox(height: 10,),
                            Text(vouchers[index].date,
                              style: TextStyle(
                                  color: Color(0xffC8C8C8),
                                  fontSize: 15,
                                  fontFamily: "Nunito"
                              ),)
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
