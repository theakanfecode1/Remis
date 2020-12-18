import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingWidget extends StatefulWidget {
  final String message;

  LoadingWidget({this.message});

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1500))
          ..repeat(reverse: true);
    animation = Tween(begin: 0.1, end: 1.0).animate(controller);
    animation.addStatusListener((status) {});
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff1A3365),
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.84),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: FadeTransition(
                opacity: animation,
                child: Image.asset("assets/remiswithoutlogo.png",width: 150,height: 150,),
                ),
              ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.message,
              style: TextStyle(
                  fontFamily: "MontserratMedium",
                  fontSize: 25,
                  color: Color(0xff1A3365)),
            ),
          ],
        ),
      ),
    );
  }
}
