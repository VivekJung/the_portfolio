import 'package:flutter/material.dart';
import 'package:the_portfolio/resources/app_colors.dart';
import 'package:the_portfolio/resources/custom_widgets/basic_text_styling.dart';
import 'package:the_portfolio/resources/custom_widgets/pageroute_animation.dart';
import 'package:the_portfolio/screens/dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation? _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _controller!.repeat(reverse: true);
    _animation = Tween(begin: 10.0, end: 20.0).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });

    Future.delayed(const Duration(seconds: 2)).then((_) {
      Navigator.popAndPushNamed(context, '/');
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              appLogo(),
              const SizedBox(height: 40),
              appName(),

              // loadIcon(),
            ],
          )),
    );
  }

  appLogo() {
    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColors.mainMint,
          boxShadow: [
            BoxShadow(
              color: AppColors.mainMint,
              blurRadius: _animation!.value,
              spreadRadius: 10,
            )
          ],
        ),
        child: const Icon(Icons.dashboard, color: AppColors.white, size: 120));
  }

  appName() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          // Icon(Icons.dashboard, color: AppColors.mainMint),
          // SizedBox(width: 10),
          BasicTextStyling(
            text: 'PORTFOLIO',
            txtColor: AppColors.mainMint,
            fontWeight: FontWeight.w400,
            fontSize: 32,
          ),
        ],
      ),
    );
  }
}

// Image.asset(
              // 'assets/images/application.png',
              // fit: BoxFit.contain,
            // ),