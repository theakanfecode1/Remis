import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/flutter_qr_reader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.widget.dart';
import 'package:remis/screens/fuelamount.dart';

class QrCodeScanner extends StatefulWidget {
  @override
  _QrCodeScannerState createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner>
    with SingleTickerProviderStateMixin {
  QrReaderViewController _controller;
  bool isOk = false;
  AnimationController _animationController;
  Animation<Offset> _offsetAnimation;

  Future setUpScanner() async {
    if (await Permission.camera.request().isGranted) {
      setState(() {
        isOk = true;
      });
    } else {}
  }

  @override
  void initState() {
    setUpScanner();
    _animationController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 10.0),
      end: Offset(0.0, 100.0),
    ).animate(_animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color(0xff1A3365),
        title: Text(
          "Buy Fuel",
          style: TextStyle(
            fontFamily: "NunitoSemiBold",
            fontSize: 18,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              "assets/scan.svg",
              color: Color(0xff1A3365),
              width: 50,
            ),
            SizedBox(height: 20),
            Text(
              "Wait for the camera to scan the Qr code",
              style: TextStyle(
                  color: Color(0xff1A3365), fontFamily: "Nunito", fontSize: 15),
            ),
            SizedBox(height: 20),
            if (isOk)
              Stack(
                children: <Widget>[
                  Container(
                    width: 300,
                    height: 300,
                    child: QrReaderView(
                      width: 300,
                      height: 300,
                      callback: (container) {
                        this._controller = container;
                        _controller.startCamera(onScan);
                      },
                    ),
                  ),
                  SlideTransition(
                    position: _offsetAnimation,
                    child: Container(
                      width: 300,
                      height: 3,
                      color: Color(0xffFFBB00),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void onScan(String v, List<Offset> offsets) {
    Fluttertoast.showToast(msg: v);
    _controller.stopCamera();
    Navigator.of(context).push(CupertinoPageRoute(
        builder: (BuildContext context) => (FuelAmount()),
        maintainState: false));
  }
}
