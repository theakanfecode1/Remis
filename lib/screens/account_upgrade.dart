import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountUpgrade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff1A3365),
        title: Text(
          "Account Upgarde",
          style: TextStyle(fontSize: 18, fontFamily: "NunitoSemiBold"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Color(0xff1A3365),
                      ),
                      Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 10,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Email address verified",
                          style: TextStyle(
                              color: Color(0xff1A3365),
                              fontFamily: "MontserratSemiBold"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Your email address has been verified",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontFamily: "MontserratMedium"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[500],
                  radius: 5,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[500],
                  radius: 5,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[500],
                  radius: 5,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[500],
                  radius: 5,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.grey[500],
                      ),
                      Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 10,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Level 1",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontFamily: "MontserratSemiBold"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Increase your daily transaction limit to N50,000.",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontFamily: "MontserratMedium"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 38.0),
                child: RaisedButton(
                  onPressed: () {},
                  elevation: 0,
                  color: Color(0xff1A3365),
                  child: Text(
                    "Link BVN",
                    style: TextStyle(
                        color: Colors.white, fontFamily: "MontserratMedium"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
