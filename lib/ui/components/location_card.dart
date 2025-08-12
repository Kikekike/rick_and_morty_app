import 'package:flutter/material.dart';
import 'package:rickandmortyapp/models/location_model.dart';
import 'package:rickandmortyapp/theme/app_text_styles.dart';
import 'package:rickandmortyapp/ui/pages/location_details_page.dart';
import 'package:rickandmortyapp/ui/widgets/auto_scroll_text.dart';
import 'package:rickandmortyapp/ui/widgets/custom_main_container.dart';
import 'package:rickandmortyapp/ui/widgets/custom_principal_text.dart';
import 'package:rickandmortyapp/ui/widgets/custom_separator.dart';

class LocationCard extends StatelessWidget {
  final LocationModel location;

  const LocationCard({required this.location, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LocationDetailsPage(location: location),
          ),
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: CustomMainContainer(
          pl: 10,
          pr: 10,
          mb: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoScrollText(
                text: "#${location.id} ${location.name}",
                style: AppTextStyles.principalWith(
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 5),
              const CustomSeparator(),
              const SizedBox(height: 5),
              CustomPrincipalText(
                text: "Type: ${location.type}",
                color: Colors.white,
                fontSize: 12,
              ),
              CustomPrincipalText(
                text: "Dinemsion: ${location.dimension}",
                color: Colors.white,
                fontSize: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
