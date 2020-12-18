import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:remis/stores/wallettransactionstore.dart';
import 'package:remis/values/strings/networkcallsmessgaes.dart';

class VendorList extends StatefulWidget {
  @override
  _VendorListState createState() => _VendorListState();
}

class _VendorListState extends State<VendorList>
    with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Animation _animation;
  var dateTime = "";

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _animation.addStatusListener((status) {});
    _animationController.forward();

    var date = DateTime.now();
    var newDt = DateFormat.yMMMd().format(date);
    dateTime = (newDt).toString();

  }

//  filterDates(first,end) =>
//   setState(() =>
//     dateTime = first +" - "+end
//   );
//  }
  @override
  Widget build(BuildContext context) {
    final transactionStore = Provider.of<WalletTransactionStore>(context);
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff1A3365),
        title: Text(
          "Vendor List",
          style: TextStyle(
            fontFamily: "NunitoSemiBold",
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: Color(0xff1A3365),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Color(0xffD8FBE4),
                      radius: 40,
                    ),
                    SvgPicture.asset(
                      "assets/fuellocation.svg",
                      color: Color(0xff1A3365),
                      width: 40,
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left:30.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Nearby",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: "NunitoBold"),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Vendors",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: "NunitoSemiBold"),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right:30.0),
                      child: Text(
                        "0",
                        style: TextStyle(
                            color: Color(0xffFFBB00),
                            fontSize: 50),
                      ),
                    ),


                  ],
                ),
              ],
            ),
          ),
          Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
                width: double.infinity,
                height: 60,
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 20,),
                    Expanded(child: Text("Sort by Price",style: TextStyle(
                        fontSize: 15,
                        fontFamily: "NunitoSemiBold",
                      color: Colors.grey
                    ),)),
                  ],
                )),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Observer(
              builder:(_)=> ListView.builder(
                  itemCount: 1,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SizeTransition(
                      sizeFactor: _animationController,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Color(0xff1A3365),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10))),
                                width: 6,
                              ),
                              SizedBox(width: 10,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/gas.png",width: 40,),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    ("Eterna PLC"),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "NunitoSemiBold",
                                        color: Color(0xff1A3365)),
                                  ),
                                  SizedBox(height: 3,),
                                  Text(
                                    ("₦ "+"185.00"+" per litre"),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "NunitoSemiBold",
                                        color: Color(0xff1A3365)),
                                  ),
                                  SizedBox(height: 3,),
                                  Row(
                                    children: <Widget>[
                                      SvgPicture.asset("assets/vendorclock.svg",color: Colors.grey,),
                                      SizedBox(width: 10,),
                                      Text(
                                        ("48"+" Hours"),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "NunitoSemiBold",
                                            color: Colors.grey,),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
