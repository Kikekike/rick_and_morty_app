import 'package:flutter/material.dart';
import 'package:rickandmortyapp/constants/strings.dart';
import 'package:rickandmortyapp/theme/app_images.dart';
import 'package:rickandmortyapp/ui/widgets/status_indicator.dart';

class StatusIcon extends StatelessWidget {
  final String status;

  const StatusIcon({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case AppStrings.statusAlive:
        return const StatusIndicator(status: AppStrings.statusAlive);
      case AppStrings.statusDead:
        return const StatusIndicator(status: AppStrings.statusDead);
      case AppStrings.statusUnknown:
        return const StatusIndicator(status: AppStrings.statusUnknown);
      case AppStrings.statusAny:
      default:
        return Image.asset(
          AppImages.filterAny,
          width: 29,
          height: 27,
          fit: BoxFit.cover,
        );
    }
  }
}
