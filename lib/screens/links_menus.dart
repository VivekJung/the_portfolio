import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          height: MediaQuery.of(context).size.height - 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Container(
                          height: 3, width: 80, color: AppColors.txtColor),
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
                                    routePageName: const SendMailScreen()));
                          },
                          child: const BasicTextStyling(
                              text: "Contact",
                              fontSize: 40,
                              fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                  ),
                  // ! social links
                  Padding(
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
              //name
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
