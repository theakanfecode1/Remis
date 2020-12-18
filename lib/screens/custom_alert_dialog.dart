import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  final Function func;
  final String title;
  final String message;
  final String btnText;

  CustomAlertDialog({this.func, this.title, this.message, this.btnText});

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.title,
              style: TextStyle(
                  color: Color(0xff1A3365), fontFamily: "Nunito", fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.message,
              style: TextStyle(
                  color: Color(0xff1A3365),
                  fontFamily: "NunitoSemiBold",
                  fontSize: 15),
            ),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF3F3F3),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3 + 50,
                        height: 50,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: Colors.white,
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                color: Color(0xff1A3365),
                                fontSize: 15,
                                fontFamily: "NunitoSemiBold"),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3 + 50,
                        height: 50,
                        child: RaisedButton(
                          onPressed: () {
//                            Navigator.of(context).pop();
                            Navigator.of(context,rootNavigator: true).popAndPushNamed("/login");
                          },
                          color: Color(0xff1A3365),
                          child: Text(
                            widget.btnText,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "NunitoSemiBold",
                                fontSize: 15),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
