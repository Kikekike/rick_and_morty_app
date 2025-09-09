import 'package:flutter/material.dart';
import 'package:rickandmortyapp/constants/strings.dart';
import 'package:rickandmortyapp/models/location_model.dart';
import 'package:rickandmortyapp/ui/components/residents_component.dart';
import 'package:rickandmortyapp/ui/layout/base_layout.dart';
import 'package:rickandmortyapp/ui/widgets/custom_character_data.dart';
import 'package:rickandmortyapp/ui/widgets/custom_main_container.dart';
import 'package:rickandmortyapp/ui/widgets/custom_principal_text.dart';
import 'package:rickandmortyapp/utils/date_formatter.dart';

class LocationDetailsPage extends StatefulWidget {
  final LocationModel location;

  const LocationDetailsPage({super.key, required this.location});

  @override
  State<LocationDetailsPage> createState() => _LocationDetailsPageState();
}

class _LocationDetailsPageState extends State<LocationDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        showBackButton: true,
        tp: 12,
        bp: 24,
        title: AppStrings.locationDetailsTitle,
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                CustomMainContainer(
                  mb: 8,
                  child: CustomPrincipalText(
                    textAlign: TextAlign.center,
                    text: "#${widget.location.id} ${widget.location.name}",
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                CustomMainContainer(
                  pb: 20,
                  pt: 18,
                  mb: 8,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomCharacterData(
                        titleData: AppStrings.type,
                        data: widget.location.type,
                      ),
                      CustomCharacterData(
                        titleData: AppStrings.dimension,
                        data: widget.location.dimension,
                      ),
                      CustomCharacterData(
                        titleData: AppStrings.created,
                        data: formatDate(widget.location.created),
                        bp: 0,
                      ),
                    ],
                  ),
                ),
                CustomMainContainer(
                  mb: 8,
                  pt: 12,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: double.infinity,
                        child: CustomPrincipalText(
                          textAlign: TextAlign.left,
                          text: "${AppStrings.residents} :",
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ResidentsComponent(residentIds: widget.location.residents)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
