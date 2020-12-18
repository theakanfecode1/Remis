import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class FilterWidget extends StatefulWidget {
  final Function func;

  FilterWidget({this.func});

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  String startDateStr = "";
  String endDateStr = "";
  int selectedDateChoice = 0;

  @override
  void initState() {
    super.initState();
    var date = DateTime.now();
    var newDt = DateFormat.yMMMd().format(date);
    startDateStr = (newDt).toString();
    endDateStr = (newDt).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Filter by Date",
              style: TextStyle(
                  color: Color(0xff1A3365),
                  fontFamily: "NunitoSemiBold",
                  fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDateChoice = 0;
                          var date = DateTime.now();
                          var newDt = DateFormat.yMMMd().format(date);
                          startDateStr = (newDt).toString();
                        });
                      },
                      child: Container(
                        height: 60,
                        width: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: selectedDateChoice == 0
                                ? Color(0xff1A3365)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset(
                              "assets/week.svg",
                              color: selectedDateChoice == 0
                                  ? Colors.white
                                  : Color(0xff1A3365),
                            ),
                            Text(
                              "Today",
                              style: TextStyle(
                                  color: selectedDateChoice == 0
                                      ? Colors.white
                                      : Color(0xff1A3365),
                                  fontFamily: "Nunito",
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDateChoice = 1;
                          DateTime today = DateTime.now();
                          var firstDayOfTheweek =
                              today.subtract(new Duration(days: today.weekday));
                          var newDt =
                              DateFormat.yMMMd().format(firstDayOfTheweek);
                          startDateStr = (newDt).toString();
                        });
                      },
                      child: Container(
                        height: 60,
                        width: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: selectedDateChoice == 1
                                ? Color(0xff1A3365)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset(
                              "assets/today.svg",
                              color: selectedDateChoice == 1
                                  ? Colors.white
                                  : Color(0xff1A3365),
                            ),
                            Text(
                              "This Week",
                              style: TextStyle(
                                  color: selectedDateChoice == 1
                                      ? Colors.white
                                      : Color(0xff1A3365),
                                  fontFamily: "Nunito",
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDateChoice = 2;
                          DateTime today = DateTime.now();
                          var firstDayOfMonth = today.year.toString() +
                              "-0" +
                              today.month.toString() +
                              "-01";
                          DateTime db = DateTime.parse(firstDayOfMonth);
                          var newDt = DateFormat.yMMMd().format(db);
                          startDateStr = newDt.toString();
//
                        });
                      },
                      child: Container(
                        height: 60,
                        width: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: selectedDateChoice == 2
                                ? Color(0xff1A3365)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset(
                              "assets/monthly.svg",
                              color: selectedDateChoice == 2
                                  ? Colors.white
                                  : Color(0xff1A3365),
                            ),
                            Text(
                              "This Month",
                              style: TextStyle(
                                  color: selectedDateChoice == 2
                                      ? Colors.white
                                      : Color(0xff1A3365),
                                  fontFamily: "Nunito",
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Or Select a Custom Date Range",
              style: TextStyle(
                  color: Color(0xff1A3365),
                  fontFamily: "NunitoSemiBold",
                  fontSize: 13),
            ),
          ),
          SizedBox(
            height: 20,
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
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 10, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(3000))
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            startDateStr = DateFormat.yMMMd().format(value);
                          });
                        }
                      });
                    },
                    child: Card(
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/week.svg',
                                  width: 30,
                                  color: Color(0xff1A3365),
                                )
                              ],
                            ),
                          ),
                          Flexible(
                              child: Text(
                            startDateStr,
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 15,
                                fontFamily: "Nunito"),
                          )),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 100.0, left: 10, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(3000))
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            endDateStr = DateFormat.yMMMd().format(value);
                          });
                        }
                      });
                    },
                    child: Card(
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/week.svg',
                                  color: Color(0xff1A3365),
                                )
                              ],
                            ),
                          ),
                          Flexible(
                              child: Text(
                            endDateStr,
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 15,
                                fontFamily: "Nunito"),
                          )),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200.0),
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
                            widget.func(startDateStr, endDateStr);
                            Navigator.of(context).pop();
                          },
                          color: Color(0xff1A3365),
                          child: Text(
                            "Apply",
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
