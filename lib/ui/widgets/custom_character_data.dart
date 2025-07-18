import 'package:flutter/material.dart';
import 'package:rickandmortyapp/constants/strings.dart';
import 'package:rickandmortyapp/ui/widgets/custom_principal_text.dart';
import 'package:rickandmortyapp/ui/widgets/custom_separator.dart';
import 'package:rickandmortyapp/ui/widgets/status_indicator.dart';

class CustomCharacterData extends StatelessWidget {
  final String titleData;
  final String data;
  final double bp;

  const CustomCharacterData(
      {this.titleData = "", this.data = "", this.bp = 20, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrincipalText(
            textAlign: TextAlign.start,
            text: "$titleData :",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomPrincipalText(
                  textAlign: TextAlign.start,
                  text: data,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              if (titleData == AppStrings.status)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: StatusIndicator(status: data),
                ),
            ],
          ),
          const SizedBox(height: 5),
          const CustomSeparator()
        ],
      ),
    );
  }
}
