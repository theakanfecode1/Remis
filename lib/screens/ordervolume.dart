import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remis/screens/address.dart';

class OrderVolume extends StatefulWidget {
  @override
  _OrderVolumeState createState() => _OrderVolumeState();
}

class _OrderVolumeState extends State<OrderVolume> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Order Volume",
          style: TextStyle(fontSize: 18, fontFamily: "MontserratSemiBold"),
        ),
        backgroundColor: Color(0xff1A3365),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              width: double.infinity,
              color: Color(0xff1A3365),
              child: Image.asset(
                "assets/nozzlewithcar.jpg",
                width: double.infinity,
                height: 250,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        "How many litres do you want to order?",
                        style: TextStyle(
                            fontSize: 17,
                            color: Color(0xff1A3365),
                            fontFamily: "MontserratMedium"),
                      ),
                    ),
                    SizedBox(
                      height: 50,
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
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(width: 5,),
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
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Minimum volume is 500 litres",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "Nunito",
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                SizedBox(
                                  height: 58,
                                  child: RaisedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(CupertinoPageRoute(
                                          builder: (BuildContext context) =>
                                              Address(),
                                          maintainState: false));
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
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
    );
  }
}
