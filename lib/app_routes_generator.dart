import 'package:flutter/material.dart';
import 'package:the_portfolio/screens/dashboard.dart';
import 'package:the_portfolio/screens/send_mail_screen.dart';
import 'package:the_portfolio/screens/splash_screen.dart';

class AppRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //Getting args passed in while callingNavigatro.pushNamed
    final args = settings
        .arguments; // these are arguments that we want to pash throught routing

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case '/splashScreen':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/sendMailScreen':
        return MaterialPageRoute(builder: (_) => const SendMailScreen());

      case '/implementingwhenargsareneeded':
        //validating if data-type is correct
        if (args is String) {
          //not needed but just putting here for future references
          return MaterialPageRoute(builder: (_) => const SplashScreen());
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.4),
        body: Center(
          child: Container(
              height: MediaQuery.of(_).size.height * 0.5,
              width: MediaQuery.of(_).size.width * 0.7,
              child: Image.asset('assets/images/jungeyadda.PNG',
                  fit: BoxFit.fill)),
        ),
      );
    });
  }
}
