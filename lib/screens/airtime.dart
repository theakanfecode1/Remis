import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:native_contact_picker/native_contact_picker.dart';
import 'package:provider/provider.dart';
import 'package:remis/screens/inputpin.dart';
import 'package:remis/stores/accountloggedinstore.dart';

class Airtime extends StatefulWidget {


  @override
  _AirtimeState createState() => _AirtimeState();
}

class _AirtimeState extends State<Airtime> {
  final NativeContactPicker _nativeContactPicker = NativeContactPicker();
  int position = 0;
  PageController controller = PageController(initialPage: 0);
  String myPhoneNumber;
  TextEditingController selfPhoneController = TextEditingController();
  TextEditingController selfAmountController = TextEditingController();
  TextEditingController contactsPhoneController = TextEditingController();
  TextEditingController contactsAmountController = TextEditingController();
  TextEditingController otherPhoneController = TextEditingController();
  TextEditingController otherAmountController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getPhoneNumber();

    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Airtime",
          style: TextStyle(fontSize: 18, fontFamily: "MontserratSemiBold"),
        ),
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
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 130, top: 50),
                  child: Hero(
                    tag: "touch-screen",
                    child: SvgPicture.asset(
                      "assets/touch-screen.svg",
                      color: Colors.white,
                      width: 50,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 200,
                left: 20,
                right: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      position = 0;
                                      controller.animateToPage(0,
                                          duration: Duration(milliseconds: 250),
                                          curve: Curves.bounceInOut);
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: position == 0
                                            ? Color(0xff1A3365)
                                            : Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Text(
                                      "Myself",
                                      style: TextStyle(
                                          color: position == 0
                                              ? Colors.white
                                              : Color(0xff1A3365),
                                          fontFamily: "Nunito"),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      position = 1;
                                      controller.animateToPage(1,
                                          duration: Duration(milliseconds: 250),
                                          curve: Curves.bounceInOut);
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: position == 1
                                            ? Color(0xff1A3365)
                                            : Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Text(
                                      "My Contact",
                                      style: TextStyle(
                                          color: position == 1
                                              ? Colors.white
                                              : Color(0xff1A3365),
                                          fontFamily: "Nunito"),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      position = 2;
                                      controller.animateToPage(2,
                                          duration: Duration(milliseconds: 250),
                                          curve: Curves.bounceInOut);
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: position == 2
                                            ? Color(0xff1A3365)
                                            : Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Text(
                                      "Other Number",
                                      style: TextStyle(
                                          color: position == 2
                                              ? Colors.white
                                              : Color(0xff1A3365),
                                          fontFamily: "Nunito"),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          elevation: 3,
                        ),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Flexible(
                        child: PageView(
                          controller: controller,
                          onPageChanged: (index) {
                            setState(() {
                              position = index;
                            });
                          },
                          children: <Widget>[
                            Stack(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: Card(
                                          elevation: 3.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 13, 10, 13),
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: <Widget>[
                                                    CircleAvatar(
                                                      radius: 13.0,
                                                      backgroundColor:
                                                          Color(0xffE6EFFF),
                                                    ),
                                                    SvgPicture.asset(
                                                      "assets/phone.svg",
                                                      color: Color(0xff1A3365),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                child: TextFormField(
                                                  controller: selfPhoneController,
                                                  enabled: false,
                                                  style: TextStyle(
                                                      fontFamily: 'Nunito',
                                                      color: Colors.grey[600]),
                                                  decoration: InputDecoration(
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    border: InputBorder.none,
                                                    hintText: "Phone Number",
                                                    hoverColor: Colors.red,
                                                    hintStyle: TextStyle(
                                                      fontFamily: 'Nunito',
                                                    ),
                                                  ),
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Card(
                                          elevation: 3.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 13, 10, 13),
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: <Widget>[
                                                    CircleAvatar(
                                                      radius: 13.0,
                                                      backgroundColor:
                                                          Color(0xffE6EFFF),
                                                    ),
                                                    Text(
                                                      "₦",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color(
                                                              0xff1A3365)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                child: TextField(
                                                  controller: selfAmountController,
                                                  style: TextStyle(
                                                      fontFamily: 'Nunito',
                                                      color: Colors.grey[600]),
                                                  decoration: InputDecoration(
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    border: InputBorder.none,
                                                    hintText: "Amount",
                                                    hoverColor: Colors.red,
                                                    hintStyle: TextStyle(
                                                      fontFamily: 'Nunito',
                                                    ),
                                                  ),
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: SizedBox(
                                          height: 45,
                                          child: RaisedButton(
                                            onPressed: () {
                                              Navigator.of(context,rootNavigator: true).push(CupertinoPageRoute(
                                                  builder: (BuildContext context) =>
                                                      InputPin(),
                                                  maintainState: false));
                                            },
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
                              ],
                            ),
                            Stack(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: GestureDetector(
                                          onTap: () async{
                                            Contact contact = await  _nativeContactPicker.selectContact();
                                            if(contact !=null){
                                              setState(() {
                                                contactsPhoneController.text = contact.phoneNumber;
                                              });
                                            }

                                          },
                                          child: Card(
                                            elevation: 3.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(9.0),
                                            ),
                                            child: Row(
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 13, 10, 13),
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: <Widget>[
                                                      CircleAvatar(
                                                        radius: 13.0,
                                                        backgroundColor:
                                                            Color(0xffE6EFFF),
                                                      ),
                                                      Text(
                                                        "₦",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Color(
                                                                0xff1A3365)),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Flexible(
                                                  child: TextField(
                                                    controller: contactsPhoneController,
                                                    enabled: false,
                                                    style: TextStyle(
                                                        fontFamily: 'Nunito',
                                                        color: Colors.grey[600]),
                                                    decoration: InputDecoration(
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      border: InputBorder.none,
                                                      hintText: "Select Contact",
                                                      hoverColor: Colors.red,
                                                      hintStyle: TextStyle(
                                                        fontFamily: 'Nunito',
                                                      ),
                                                    ),
                                                    keyboardType:
                                                        TextInputType.phone,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: Color(0xff1A3365),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Card(
                                          elevation: 3.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 13, 10, 13),
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: <Widget>[
                                                    CircleAvatar(
                                                      radius: 13.0,
                                                      backgroundColor:
                                                          Color(0xffE6EFFF),
                                                    ),
                                                    Text(
                                                      "₦",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color(
                                                              0xff1A3365)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                child: TextField(
                                                  controller: contactsAmountController,
                                                  style: TextStyle(
                                                      fontFamily: 'Nunito',
                                                      color: Colors.grey[600]),
                                                  decoration: InputDecoration(
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    border: InputBorder.none,
                                                    hintText: "Amount",
                                                    hoverColor: Colors.red,
                                                    hintStyle: TextStyle(
                                                      fontFamily: 'Nunito',
                                                    ),
                                                  ),
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
                              ],
                            ),
                            Stack(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: Card(
                                          elevation: 3.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 13, 10, 13),
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: <Widget>[
                                                    CircleAvatar(
                                                      radius: 13.0,
                                                      backgroundColor:
                                                          Color(0xffE6EFFF),
                                                    ),
                                                    Text(
                                                      "₦",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color(
                                                              0xff1A3365)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                child: TextField(
                                                  controller: otherPhoneController,
                                                  style: TextStyle(
                                                      fontFamily: 'Nunito',
                                                      color: Colors.grey[600]),
                                                  decoration: InputDecoration(
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    border: InputBorder.none,
                                                    hintText: "Phone Number",
                                                    hoverColor: Colors.red,
                                                    hintStyle: TextStyle(
                                                      fontFamily: 'Nunito',
                                                    ),
                                                  ),
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Card(
                                          elevation: 3.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 13, 10, 13),
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: <Widget>[
                                                    CircleAvatar(
                                                      radius: 13.0,
                                                      backgroundColor:
                                                          Color(0xffE6EFFF),
                                                    ),
                                                    Text(
                                                      "₦",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color(
                                                              0xff1A3365)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                child: TextField(
                                                  controller: otherAmountController,
                                                  style: TextStyle(
                                                      fontFamily: 'Nunito',
                                                      color: Colors.grey[600]),
                                                  decoration: InputDecoration(
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    border: InputBorder.none,
                                                    hintText: "Amount",
                                                    hoverColor: Colors.red,
                                                    hintStyle: TextStyle(
                                                      fontFamily: 'Nunito',
                                                    ),
                                                  ),
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
                              ],
                            ),
                          ],
                        ),
                      ),
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

  void getPhoneNumber() async {
    final loggedInUser = Provider.of<AccountLoggedInStore>(context);
    selfPhoneController.text = loggedInUser.user.phoneNumber;
  }
  @override
  void dispose() {
    selfPhoneController.dispose();
    selfAmountController.dispose();
    contactsPhoneController.dispose();
    contactsAmountController.dispose();
    otherPhoneController.dispose();
    otherAmountController.dispose();

    controller.dispose();
    super.dispose();
  }
}
