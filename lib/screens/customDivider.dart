import 'package:flutter/material.dart';

class HorizontalOrLine extends StatelessWidget {
  const HorizontalOrLine({
    this.label,
    this.height,
  });

  final String label;
  final double height;

  @override
  Widget build(BuildContext context) {

    return Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 30.0, right: 20.0),
            child: Divider(
              color: Color(0xffC8C8C8),
              height: height,
            )),
      ),

      Text(label,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 20,
        color: Color(0xff1A3365),
      ),),

      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 30.0, right: 20.0),
            child: Divider(
              color: Color(0xffC8C8C8),
              height: height,
            )),
      ),
    ]);
  }
}
