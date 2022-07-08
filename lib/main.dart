import 'package:flutter/material.dart';
import 'package:the_portfolio/app_routes_generator.dart';
import 'package:the_portfolio/resources/app_colors.dart';

void main() {
  runApp(const TheApp());
}

class TheApp extends StatelessWidget {
  const TheApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Vivek Jung Hamal",
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
        primaryColor: AppColors.mainMint,
        fontFamily: "Roboto",
      ),
      initialRoute: '/splashScreen',
      onGenerateRoute: AppRouteGenerator.generateRoute,
    );
  }
}
