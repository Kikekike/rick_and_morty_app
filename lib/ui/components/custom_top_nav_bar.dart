import 'package:flutter/material.dart';
import 'package:rickandmortyapp/theme/app_colors.dart';
import 'package:rickandmortyapp/ui/widgets/custom_principal_text.dart';

class CustomTopNavBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const CustomTopNavBar(
      {super.key, required this.title, this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: AppColors.topNavBarColor,
      //alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showBackButton)
            IconButton(
              icon:
                  const Icon(Icons.arrow_back, color: AppColors.titleTextColor),
              onPressed: () => Navigator.pop(context),
            )
          else
            const SizedBox(width: 24),
          Expanded(
            child: Center(
              child: CustomPrincipalText(
                text: title,
                color: AppColors.titleTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 24),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
