import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_portfolio/resources/app_colors.dart';
import 'package:the_portfolio/resources/custom_widgets/basic_text_styling.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SendMailScreen extends StatefulWidget {
  const SendMailScreen({Key? key}) : super(key: key);

  @override
  State<SendMailScreen> createState() => _SendMailScreenState();
}

class _SendMailScreenState extends State<SendMailScreen> {
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void initState() {
    subjectController;
    messageController;
    super.initState();
  }

  @override
  void dispose() {
    subjectController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainMint,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.red,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          height: MediaQuery.of(context).size.height - 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const BasicTextStyling(
                    text: "Questions and Feedbacks",
                    fontSize: 30,
                    txtColor: AppColors.txtColor,
                  ),
                  const SizedBox(height: 50),
                  buildTextFormField(
                    title: "How may I help you ?",
                    controller: subjectController,
                  ),
                  const SizedBox(height: 50),
                  buildTextFormField(
                    title: "Can you add more info to this ?",
                    controller: messageController,
                    maxlines: 8,
                  ),
                ],
              ),
              //button
              sendMailBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Container sendMailBtn() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          side: const BorderSide(width: 1, color: AppColors.txtColor),
        ),
        onPressed: () {
          launchEmail(
            subject: subjectController.text,
            message: messageController.text,
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FaIcon(FontAwesomeIcons.paperPlane, color: AppColors.mainMint),
            SizedBox(width: 20),
            BasicTextStyling(
              text: "Send this mail to me",
              fontSize: 20,
              fontWeight: FontWeight.w400,
              txtColor: AppColors.mainMint,
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextFormField({
    required String title,
    required TextEditingController controller,
    int? maxlines,
  }) {
    String labelText = "";
    if (title == "How may I help you ?") {
      labelText = "Subject";
    } else {
      labelText = "Message";
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BasicTextStyling(
            text: title, fontSize: 20, fontWeight: FontWeight.w400),
        const SizedBox(height: 8),
        TextFormField(
          cursorColor: AppColors.txtColor,
          controller: controller,
          maxLines: maxlines ?? 1,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(color: AppColors.txtColor),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.txtColor, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ],
    );
  }

  Future launchEmail({required String subject, required String message}) async {
    const myEmail = "vivekjunghamal@gmail.com";
    final url =
        'mailto:$myEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';

    if (await canLaunchUrlString(url)) {
      await launchUrlString(
        url,
        webViewConfiguration: const WebViewConfiguration(),
      );
    }
  }
}
