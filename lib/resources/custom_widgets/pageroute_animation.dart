import 'package:flutter/cupertino.dart';

class PagerRouteAnimation extends PageRouteBuilder {
  final Widget routePageName;
  final int? duration;

  PagerRouteAnimation({required this.routePageName, this.duration})
      : super(
          transitionDuration: Duration(milliseconds: duration ?? 700),
          pageBuilder: (BuildContext context, Animation<double> animation1,
              Animation<double> animation2) {
            return routePageName;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
              Widget widget) {
            animation1 = CurvedAnimation(
                parent: animation1, curve: Curves.easeInOutQuint);

            return ScaleTransition(
              scale: animation1,
              alignment: Alignment.center,
              child: widget,
            );
          },
        );
}
