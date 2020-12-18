import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:remis/utils/vouchers.dart';
class SubsidyHistory extends StatefulWidget {
  @override
  _SubsidyHistoryState createState() => _SubsidyHistoryState();
}

class _SubsidyHistoryState extends State<SubsidyHistory> with SingleTickerProviderStateMixin {
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
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800))
    ;
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _animation.addStatusListener((status) { });
    _animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff1A3365),
        title: Text("Subsidy History",style: TextStyle(
          fontFamily: "NunitoSemiBold",
          fontSize: 18,
        ),
        ),
        actions: <Widget>[
          SvgPicture.asset("assets/filter.svg",color: Colors.white,)
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: Color(0xff1A3365),
            child: Column(
              children: <Widget>[
                SizedBox(height: 40),
                SvgPicture.asset("assets/sale.svg",
                  width: 50,
                  color: Colors.white,),
                SizedBox(height: 30),
                Text("Total Spending",
                  style: TextStyle(
                      color: Color(0xffFFBB00),
                      fontSize: 20,
                      fontFamily: "Nunito"
                  ),),
                SizedBox(height: 15),
                Text(
                  "₦500,000.70",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "NunitoSemiBold",
                      fontSize: 20),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,),
            child: Hero(
              tag:"date",
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Text(
                  "Recent",
                  style: TextStyle(
                      color: Color(0xff1A3365),
                      fontSize: 15,
                      fontFamily: "MontserratMedium"),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: vouchers.length,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return SizeTransition(
                    sizeFactor: _animationController,
                    child: Padding(
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
                              SvgPicture.asset("assets/sale.svg",
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
                    ),
                  );
                }),
          )
        ],
      ),
    );

  }
}
