import 'package:flutter/material.dart';
import 'package:rickandmortyapp/theme/app_text_styles.dart';

class CustomPrincipalText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign? textAlign;

  const CustomPrincipalText({
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.textAlign,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: AppTextStyles.principalWith(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
      ),
    );
  }
}
