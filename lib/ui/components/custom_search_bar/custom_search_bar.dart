import 'package:flutter/material.dart';
import 'package:rickandmortyapp/constants/strings.dart';
import 'package:rickandmortyapp/theme/app_colors.dart';
import 'package:rickandmortyapp/theme/app_text_styles.dart';
import 'package:rickandmortyapp/ui/components/custom_search_bar/status_popup_menu.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String selectedStatus;
  final Function(String) onSearchChanged;
  final Function(String)? onStatusSelected;
  final String hintText;
  final bool hasStatus;

  const CustomSearchBar(
      {Key? key,
      required this.controller,
      this.selectedStatus = AppStrings.statusAny,
      required this.onSearchChanged,
      this.onStatusSelected,
      this.hintText = AppStrings.searchHintCharacter,
      this.hasStatus = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.searchBarColor,
          border: Border.all(color: AppColors.cardTitleColor, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 50,
        alignment: Alignment.center,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                maxLength: 50,
                style: AppTextStyles.principalWith(
                  fontSize: 17,
                  color: AppColors.homeCardColor,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,
                      color: AppColors.homeCardColor, size: 27),
                  hintStyle: AppTextStyles.principalWith(
                    fontSize: 17,
                    color: AppColors.cardTitleColor,
                  ),
                  hintText: hintText,
                  border: InputBorder.none,
                  counterText: '',
                ),
                onChanged: onSearchChanged,
              ),
            ),
            const SizedBox(width: 5),
            if (hasStatus)
              StatusPopupMenu(
                selectedStatus: selectedStatus,
                onStatusSelected: onStatusSelected,
              ),
          ],
        ),
      ),
    );
  }
}
