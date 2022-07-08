import 'package:flutter/material.dart';
import 'package:the_portfolio/resources/app_colors.dart';

class BasicTextStyling extends StatelessWidget {
  const BasicTextStyling({
    Key? key,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    required this.text,
    this.txtColor = AppColors.txtColor,
  }) : super(key: key);
  final String text;
  final Color? txtColor;
  final FontWeight? fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: txtColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
