import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle principal = TextStyle(
    fontFamily: 'Merienda',
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static TextStyle principalWith({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
  }) {
    return principal.copyWith(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
