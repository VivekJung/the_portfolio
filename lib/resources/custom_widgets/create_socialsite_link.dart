import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_portfolio/resources/custom_widgets/basic_text_styling.dart';
import 'package:url_launcher/url_launcher.dart';

class CreateSocialSiteLink extends StatelessWidget {
  final FaIcon iconData;
  final String text;
  final String? uriText;
  const CreateSocialSiteLink({
    Key? key,
    required this.iconData,
    required this.text,
    this.uriText,
  }) : super(key: key);
  //todo : make a custom message creater for users
  customChatMesage() {}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var encoded = Uri.encodeFull(uriText!);
        var parsedUri = Uri.parse(encoded);
        if (await canLaunchUrl(parsedUri)) {
          await launchUrl(parsedUri);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Looks like $text is not installed")));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Row(
          children: [
            (iconData),
            const SizedBox(width: 16),
            BasicTextStyling(text: text, fontSize: 16),
          ],
        ),
      ),
    );
  }
}
