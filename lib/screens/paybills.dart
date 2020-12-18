
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PayBills extends StatefulWidget {
  @override
  _PayBillsState createState() => _PayBillsState();
}

class _PayBillsState extends State<PayBills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        elevation: 0,
        title: Text("Pay Bills",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "MontserratSemiBold"
          ),),
        backgroundColor: Color(0xff1A3365),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffF8F8F8),
          constraints: BoxConstraints.expand(height: 700),
          child: Stack(
            children: <Widget>[
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff1A3365),

                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 130,top: 50),
                  child: Hero(
                    tag: "pay-bills",
                    child: SvgPicture.asset("assets/business.svg",
                    color: Colors.white,
                    width: 50,),
                  ),
                ),
              ),
              Positioned(
                top: 150,
                left: MediaQuery.of(context).size.width/2-50,
                right: MediaQuery.of(context).size.width/2-50,
                child: Text("Select Bill Options",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "MontserratMedium",
                  fontSize: 10
                ),),
              ),
              Positioned(
                top: 200,
                left: 20,
                right: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 450,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xffF3F3F3)),
                  child: ListView.builder(
                    itemCount: 10,
                      itemBuilder: (context,index){
                        return Card(
                          elevation: 2,
                          child: Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  height: 73,
                                  width: 5,
                                  color: Color(0xff1A3365),
                                ),
                                SvgPicture.asset("assets/lighting-bulb.svg",
                                color: Color(0xff1A3365),),
                                Text(("Electricity"),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: "MontserratMedium",
                                  color: Color(0xff1A3365)
                                ),),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.arrow_forward,color: Color(0xff1A3365),),
                                ),
                              ],
                            ),
                          ),
                        );
                  }),
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
