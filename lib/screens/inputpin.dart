import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class InputPin extends StatefulWidget {
  @override
  _InputPinState createState() => _InputPinState();
}

class _InputPinState extends State<InputPin> {

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Input Pin",
          style: TextStyle(fontSize: 18, fontFamily: "MontserratSemiBold"),
        ),
        backgroundColor: Color(0xff1A3365),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            SvgPicture.asset("assets/confirmationagreement.svg",
            color:Color(0xff1A3365) ,
            width: 70,),
            SizedBox(height: 5,),
            Text("Confirmation",style: TextStyle(
              color: Color(0xff1A3365),
              fontSize: 17,
              fontFamily: "NunitoBold"
            ),),
            SizedBox(height: 30,),
            Text("You're about to recharge 08065546836 with airtime worth",textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontFamily: "NunitoBold"
            ),),
            SizedBox(height: 30,),

            Text("N100,000,000",style: TextStyle(
                color: Color(0xffFFBB00),
                fontSize: 25,
                fontFamily: "NunitoBold"
            ),),
            SizedBox(height: 40,),
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
                      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 13.0,
                            backgroundColor: Color(0xffE6EFFF),
                          ),
                          SvgPicture.asset(
                            'assets/password.svg',
                            width: 20,
                            color: Color(0xff1A3365),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: Form(
                        child: TextFormField(
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.grey[600]),
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            hintText: "Input Pin",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              child: Icon(
                                showPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey[600],
                              ),
                            ),
                            hoverColor: Colors.red,
                            hintStyle: TextStyle(
                              fontFamily: 'Nunito',
                            ),
                          ),
                          textInputAction: TextInputAction.done,
                          obscureText: showPassword,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
              child: SizedBox(
                height: 60,
                width: double.infinity,
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
    );
  }
}
