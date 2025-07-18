import 'package:flutter/material.dart';
import 'package:rickandmortyapp/theme/app_colors.dart';

class CustomSeparator extends StatelessWidget {
  const CustomSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: AppColors.cardTitleColor,
    );
  }
}
