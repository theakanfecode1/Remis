import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:remis/screens/home.dart';
import 'package:remis/screens/location.dart';
import 'dart:core';
import 'package:remis/screens/more.dart';
import 'package:flutter/cupertino.dart';
import 'package:remis/screens/account_history_nav.dart';

class Controller extends StatefulWidget {
  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  var map = {};
  int _currentIndex = 0;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final screens = [Home(), AccountHistoryNav(), Map(), More()];
  Widget page = Home();

  @override
  Widget build(BuildContext context) {
    final navItems = [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/home.svg',
          color: _currentIndex == 0 ? Color(0xff1A3365) : Color(0xffC8C8C8),
        ),
        title: Text(
          "Home",
          style: TextStyle(
            fontFamily: "Nunito",
            color: _currentIndex == 0 ? Color(0xff1A3365) : Color(0xffC8C8C8),
          ),
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/clock.svg',
          color: _currentIndex == 1 ? Color(0xff1A3365) : Color(0xffC8C8C8),
        ),
        title: Text(
          "History",
          style: TextStyle(
            fontFamily: "Nunito",
            color: _currentIndex == 1 ? Color(0xff1A3365) : Color(0xffC8C8C8),
          ),
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/pin.svg',
          color: _currentIndex == 2 ? Color(0xff1A3365) : Color(0xffC8C8C8),
        ),
        title: Text(
          "Find Station",
          style: TextStyle(
            fontFamily: "Nunito",
            color: _currentIndex == 2 ? Color(0xff1A3365) : Color(0xffC8C8C8),
          ),
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/bars.svg',
          color: _currentIndex == 3 ? Color(0xff1A3365) : Color(0xffC8C8C8),
        ),
        title: Text(
          "More",
          style: TextStyle(
              fontFamily: "Nunito",
              color:
                  _currentIndex == 3 ? Color(0xff1A3365) : Color(0xffC8C8C8)),
        ),
      ),
    ];
    return WillPopScope(
      onWillPop: () async {
        if(navigatorKey.currentState.widget == Map()){
          navigatorKey.currentState.maybePop();
          setState(() {
            page = screens[0];
            _currentIndex = 0;
          });
          return false;

        }else if(navigatorKey.currentState.widget == More()){
          navigatorKey.currentState.maybePop();
          setState(() {
            page = screens[0];
            _currentIndex = 0;
          });
          return false;
        }else if(navigatorKey.currentState.widget == AccountHistoryNav()){
          navigatorKey.currentState.maybePop();
          setState(() {
            page = screens[0];
            _currentIndex = 0;
          });
          return false;
        }else{
          return true;
        }

        setState(() {
          page = screens[0];
          _currentIndex = 0;
        });
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 12,
          selectedFontSize: 13,
          iconSize: 10,
          unselectedItemColor: Color(0xffC8C8C8),
          items: navItems,
          currentIndex: _currentIndex,
          onTap: (index) {

            setState(() {
              page = screens[index];
              _currentIndex = index;
            });
            navigatorKey.currentState
                .popUntil((_) => !navigatorKey.currentState.canPop());
            navigatorKey.currentState.maybePop();
          },
        ),
        body: CustomNavigator(
          navigatorKey: navigatorKey,
          home: page,
          pageRoute: PageRoutes.cupertinoPageRoute,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
