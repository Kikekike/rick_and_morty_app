import 'package:flutter/material.dart';
import 'package:rickandmortyapp/theme/app_colors.dart';
import 'package:rickandmortyapp/theme/app_images.dart';
import 'package:rickandmortyapp/ui/widgets/custom_principal_text.dart';

class HomeCardButton extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback? onTap;

  const HomeCardButton(
      {this.title = "Example",
      this.imagePath = AppImages.homeOne,
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          color: AppColors.homeCardColor,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                color: AppColors.cardTitleColor,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: CustomPrincipalText(
                      text: title, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
