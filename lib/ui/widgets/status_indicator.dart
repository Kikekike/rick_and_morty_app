import 'package:flutter/material.dart';
import 'package:rickandmortyapp/theme/app_colors.dart';

class StatusIndicator extends StatelessWidget {
  final String status;

  const StatusIndicator({this.status = "Alive", super.key});

  Color get statusColor {
    switch (status.toLowerCase()) {
      case 'alive':
        return AppColors.pageBgColor;
      case 'dead':
        return AppColors.redColor;
      default:
        return AppColors.cardTitleColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        color: statusColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
