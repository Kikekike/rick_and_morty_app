import 'package:flutter/material.dart';
import 'package:rickandmortyapp/theme/app_colors.dart';
import 'package:rickandmortyapp/theme/app_images.dart';
import 'package:rickandmortyapp/ui/widgets/custom_principal_text.dart';
import 'package:rickandmortyapp/ui/widgets/status_indicator.dart';

class CustomChildMenuItem extends StatelessWidget {
  final String text;
  final String status;

  const CustomChildMenuItem(
      {Key? key, this.text = "Any", this.status = "alive"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 48,
      width: double.infinity,
      color: AppColors.homeCardColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomPrincipalText(text: this.text, color: Colors.white),
          this.text == "Any"
              ? Image.asset(
                  AppImages.filterAny,
                  width: 29,
                  height: 27,
                  fit: BoxFit.cover,
                )
              : StatusIndicator(status: this.status),
        ],
      ),
    );
  }
}
