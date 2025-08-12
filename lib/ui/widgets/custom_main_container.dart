import 'package:flutter/material.dart';
import 'package:rickandmortyapp/theme/app_colors.dart';

class CustomMainContainer extends StatelessWidget {
  final Widget child;
  final double mb, pb, pt, pl, pr;
  final bool hasBorder;

  const CustomMainContainer(
      {required this.child,
      this.mb = 20,
      this.pb = 10,
      this.pt = 10,
      this.pl = 20,
      this.pr = 20,
      this.hasBorder = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.titleTextColor,
        border: hasBorder
            ? Border.all(
                color: AppColors.cardTitleColor,
                width: 3,
              )
            : null,
        borderRadius: BorderRadius.circular(0),
      ),
      margin: EdgeInsets.only(bottom: hasBorder ? mb : 0),
      padding: EdgeInsets.only(
        bottom: hasBorder ? pb : 0,
        top: hasBorder ? pt : 0,
        left: hasBorder ? pl : 0,
        right: hasBorder ? pr : 0,
      ),
      width: double.infinity,
      child: child,
    );
  }
}
