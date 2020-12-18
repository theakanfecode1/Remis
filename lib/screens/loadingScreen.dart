import 'package:flutter/material.dart';
import 'package:remis/screens/loadingwidget.dart';

class LoadingScreen {
  static PageRouteBuilder showLoadingScreen(String message) {
    return PageRouteBuilder(
        opaque: false,
        pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) =>
            LoadingWidget(
              message: message,
            ),
        transitionsBuilder: (
          BuildContext context,
          animation,
          secondaryAnimation,
          Widget child,
        ) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
              position: animation.drive(tween), child: child);
        });
  }
}
