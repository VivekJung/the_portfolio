import 'package:flutter/material.dart';
import 'package:the_portfolio/resources/app_colors.dart';
import 'package:the_portfolio/screens/links_menus.dart';

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
      home: const LinksAndMenus(),
    );
  }
}
