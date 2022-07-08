import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:the_portfolio/resources/app_colors.dart';
import 'package:the_portfolio/resources/custom_widgets/basic_text_styling.dart';
import 'package:the_portfolio/resources/custom_widgets/swipable_btn_remastered.dart';
import 'package:the_portfolio/screens/links_menus.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainMint,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: swipeButton(),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          height: MediaQuery.of(context).size.height - 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    Container(height: 3, width: 80, color: AppColors.txtColor),
                    const SizedBox(width: 10),
                    const BasicTextStyling(text: "Vivek Jung Hamal"),
                  ],
                ),
                //introduction
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      BasicTextStyling(
                          text: "Namaste, \n\nI am",
                          fontSize: 40,
                          fontWeight: FontWeight.w200),
                      BasicTextStyling(
                          text: "Vivek.",
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                      BasicTextStyling(
                          text: "I am an",
                          fontSize: 40,
                          fontWeight: FontWeight.w200),
                      BasicTextStyling(
                          text: "App Engineer.",
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget swipeButton() {
    // return SwipeableButtonView(
    return SwipeableButtonViewRemastered(
      buttonText: "Let's explore ...",
      buttonWidget: Icon(
        Icons.arrow_forward_ios_rounded,
        color: AppColors.darkMint,
      ),
      activeColor: AppColors.white,
      isFinished: isFinished,
      onWaitingProcess: () {
        Future.delayed(const Duration(milliseconds: 100), () {
          setState(() {
            isFinished = true;
          });
        });
      },
      onFinish: () async {
        await Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade, child: const LinksAndMenus()));

        setState(() {
          isFinished = false;
        });
      },
    );
  }
}
