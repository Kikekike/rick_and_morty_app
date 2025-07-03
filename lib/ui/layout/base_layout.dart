import 'package:flutter/material.dart';
import 'package:rickandmortyapp/theme/app_colors.dart';
import 'package:rickandmortyapp/ui/components/custom_top_nav_bar.dart';

class BaseLayout extends StatelessWidget {
  final String title;
  final Widget child;
  final double bp;
  final bool showBackButton;

  const BaseLayout(
      {required this.title,
      required this.child,
      this.bp = 50,
      this.showBackButton = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBgColor,
      appBar: CustomTopNavBar(
        title: title,
        showBackButton: showBackButton,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 24, bottom: bp),
        child: child,
      )),
    );
  }
}
