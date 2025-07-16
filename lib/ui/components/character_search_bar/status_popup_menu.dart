import 'package:flutter/material.dart';
import 'package:rickandmortyapp/constants/strings.dart';
import 'package:rickandmortyapp/theme/app_colors.dart';
import 'package:rickandmortyapp/ui/components/character_search_bar/status_icon.dart';
import 'package:rickandmortyapp/ui/widgets/custom_child_menu_item.dart';

class StatusPopupMenu extends StatelessWidget {
  final String selectedStatus;
  final Function(String) onStatusSelected;

  const StatusPopupMenu({
    Key? key,
    required this.selectedStatus,
    required this.onStatusSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: AppColors.homeCardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
        side: BorderSide(color: AppColors.cardTitleColor, width: 3),
      ),
      icon: StatusIcon(status: selectedStatus),
      onSelected: onStatusSelected,
      itemBuilder: (context) => [
        PopupMenuItem(
          padding: EdgeInsets.zero,
          value: AppStrings.statusAny,
          child: CustomChildMenuItem(text: "Any", status: AppStrings.statusAny),
        ),
        PopupMenuItem(
          padding: EdgeInsets.zero,
          value: AppStrings.statusAlive,
          child: CustomChildMenuItem(
              text: "Alive", status: AppStrings.statusAlive),
        ),
        PopupMenuItem(
          padding: EdgeInsets.zero,
          value: AppStrings.statusDead,
          child:
              CustomChildMenuItem(text: "Dead", status: AppStrings.statusDead),
        ),
        PopupMenuItem(
          padding: EdgeInsets.zero,
          value: AppStrings.statusUnknown,
          child: CustomChildMenuItem(
              text: "Unknown", status: AppStrings.statusUnknown),
        ),
      ],
    );
  }
}
