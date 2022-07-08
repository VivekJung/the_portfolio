import 'package:flutter/cupertino.dart';

class PagerRouteAnimation extends PageRouteBuilder {
  final Widget routePageName;

  PagerRouteAnimation({required this.routePageName})
      : super(
          transitionDuration: const Duration(milliseconds: 700),
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
              // sizeFactor: animation1,
              // axis: Axis.horizontal,
              // axisAlignment: -1,
              scale: animation1,

              alignment: Alignment.center,
              child: widget,
            );
          },
        );
}
