import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_portfolio/resources/app_colors.dart';
import 'package:the_portfolio/resources/custom_widgets/basic_text_styling.dart';
import 'package:the_portfolio/resources/custom_widgets/create_socialsite_link.dart';
import 'package:the_portfolio/resources/custom_widgets/pageroute_animation.dart';
import 'package:the_portfolio/resources/link_urls.dart';
import 'package:the_portfolio/screens/send_mail_screen.dart';

class LinksAndMenus extends StatefulWidget {
  const LinksAndMenus({Key? key}) : super(key: key);

  @override
  State<LinksAndMenus> createState() => _LinksAndMenusState();
}

class _LinksAndMenusState extends State<LinksAndMenus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainMint,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 0, top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            height: 16,
                            width: 16,
                            child: Image.asset(
                              'assets/images/application.png',
                              fit: BoxFit.fill,
                            )),
                        const SizedBox(width: 10),
                        const BasicTextStyling(text: "PORTFOLIO", fontSize: 16),
                      ],
                    ),
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const FaIcon(FontAwesomeIcons.xmark)),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            Container(
                                height: 3,
                                width: 80,
                                color: AppColors.txtColor),
                            const SizedBox(width: 10),
                            const BasicTextStyling(text: "Links and Screens"),
                          ],
                        ),
                        //introduction
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 40.0),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const BasicTextStyling(
                                  text: "About",
                                  fontSize: 40,
                                  fontWeight: FontWeight.w200),
                              const SizedBox(height: 10),
                              const BasicTextStyling(
                                  text: "Work",
                                  fontSize: 40,
                                  fontWeight: FontWeight.w400),
                              const SizedBox(height: 10),
                              const BasicTextStyling(
                                  text: "Services",
                                  fontSize: 40,
                                  fontWeight: FontWeight.w200),
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PagerRouteAnimation(
                                          routePageName:
                                              const SendMailScreen()));
                                },
                                child: const BasicTextStyling(
                                    text: "Contact",
                                    fontSize: 40,
                                    fontWeight: FontWeight.w200),
                              ),
                            ],
                          ),
                        ),
                        // * social links
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CreateSocialSiteLink(
                                iconData: const FaIcon(
                                  FontAwesomeIcons.linkedin,
                                  size: 18,
                                ),
                                text: "LinkedIn",
                                uriText: linkedInUrl,
                              ),
                              CreateSocialSiteLink(
                                iconData: const FaIcon(
                                  FontAwesomeIcons.github,
                                  size: 18,
                                ),
                                text: "GitHub",
                                uriText: githubUrl,
                              ),
                              CreateSocialSiteLink(
                                iconData: const FaIcon(
                                  FontAwesomeIcons.whatsapp,
                                  size: 18,
                                ),
                                text: "WhatsApp",
                                uriText: whatsappUrl,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox testButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    PagerRouteAnimation(routePageName: const SendMailScreen()));
              },
              child: const Icon(Icons.more))
        ],
      ),
    );
  }
}
