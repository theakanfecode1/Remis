import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransferDetails extends StatefulWidget {
  @override
  _TransferDetailsState createState() => _TransferDetailsState();
}

class _TransferDetailsState extends State<TransferDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        elevation: 0,
        title: Text("Remis Transfer",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "MontserratSemiBold"
          ),),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom:40.0),
                      child: SvgPicture.asset("assets/smallremis.svg",
                      color: Colors.white,
                      width: 60,),
                    ),
                    Text("Transfer to a remis account by phone number",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "NunitoSemiBold"
                    ),),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 200,
                left: 20,
                right: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 370,
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

                      Flexible(
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Container(
                              height: double.infinity,
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
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Card(
                                      elevation: 3.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(9.0),
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(10,13,10,13),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: <Widget>[
                                                CircleAvatar(
                                                  radius: 13.0,
                                                  backgroundColor: Color(0xffE6EFFF),
                                                ),
                                                SvgPicture.asset('assets/phone.svg',
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
                                                hintText: "Phone Number",
                                                hoverColor: Colors.red,
                                                hintStyle: TextStyle(
                                                  fontFamily: 'Nunito',
                                                ),
                                              ),
                                              keyboardType: TextInputType.number,
                                              onSubmitted: (text)=>FocusScope.of(context).nextFocus(),

                                              textInputAction:
                                              TextInputAction.next,
                                            ),
                                          ),
                                        ],
                                      ),),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10,0,10,0),
                                    child: Card(
                                      elevation: 3.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(9.0),
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(10,13,10,13),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: <Widget>[
                                                CircleAvatar(
                                                  radius: 13.0,
                                                  backgroundColor: Color(0xffE6EFFF),
                                                ),
                                                SvgPicture.asset('assets/naira.svg',
                                                  width: 15,
                                                  color: Color(0xff1A3365),)
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
                                                hintText: "0.00",
                                                hoverColor: Colors.red,
                                                hintStyle: TextStyle(
                                                  fontFamily: 'Nunito',
                                                ),
                                              ),
                                              keyboardType: TextInputType.text,
                                              onSubmitted: (text)=>FocusScope.of(context).nextFocus(),
                                              textInputAction:
                                              TextInputAction.next,

                                            ),
                                          ),
                                        ],
                                      ),),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Card(
                                      elevation: 3.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(9.0),
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Flexible(
                                            child: TextField(
                                              style: TextStyle(
                                                  fontFamily: 'Nunito',
                                                  color: Colors.grey[600]),
                                              decoration: InputDecoration(
                                                focusedBorder: InputBorder.none,
                                                border: InputBorder.none,
                                                hintText: "Narration",
                                                hoverColor: Colors.red,
                                                hintStyle: TextStyle(
                                                  fontFamily: 'Nunito',
                                                ),
                                              ),
                                              keyboardType: TextInputType.number,
                                              textInputAction:
                                              TextInputAction.done,
                                            ),
                                          ),
                                        ],
                                      ),),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      height: 45,
                                      child: RaisedButton(
                                        onPressed: () {},
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(8)),
                                        color: Color(0xff1A3365),
                                        child: (Text(
                                          "PROCEED",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "MontserratMedium",
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
