import 'package:flutter/material.dart';
import 'package:rickandmortyapp/theme/app_colors.dart';

class CustomMainContainer extends StatelessWidget {
  final Widget child;
  final double mb, pb, pt, pl, pr;

  const CustomMainContainer(
      {required this.child,
      this.mb = 20,
      this.pb = 10,
      this.pt = 10,
      this.pl = 20,
      this.pr = 20,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.titleTextColor,
        border: Border.all(
          color: AppColors.cardTitleColor,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(0), // Opcional: bordes redondeados
      ),
      margin: EdgeInsets.only(bottom: mb),
      padding: EdgeInsets.only(bottom: pb, top: pt, left: pl, right: pr),
      width: double.infinity,
      child: child,
    );
  }
}
