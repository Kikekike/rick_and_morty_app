import 'package:flutter/material.dart';
import 'package:rickandmortyapp/constants/strings.dart';
import 'package:rickandmortyapp/models/character_model.dart';
import 'package:rickandmortyapp/ui/layout/base_layout.dart';
import 'package:rickandmortyapp/ui/widgets/custom_character_data.dart';
import 'package:rickandmortyapp/ui/widgets/custom_circle_image_container.dart';
import 'package:rickandmortyapp/ui/widgets/custom_main_container.dart';
import 'package:rickandmortyapp/ui/widgets/custom_principal_text.dart';

class CharacterDetailsPage extends StatefulWidget {
  final CharacterModel character;

  CharacterDetailsPage({Key? key, required this.character}) : super(key: key);

  @override
  State<CharacterDetailsPage> createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final imageSize = screenHeight / 3;
    final specie = widget.character.type != ""
        ? "${widget.character.species} / ${widget.character.type}"
        : widget.character.species;

    return BaseLayout(
        title: AppStrings.characterDetailsTitle,
        showBackButton: true,
        bp: 0,
        tp: 0,
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 24),
                CustomCircleImageContainer(
                  image: widget.character.imagePath,
                  size: imageSize,
                  hasBorder: true,
                ),
                const SizedBox(height: 20),
                CustomMainContainer(
                  mb: 8,
                  child: CustomPrincipalText(
                    textAlign: TextAlign.center,
                    text: "#${widget.character.id} ${widget.character.name}",
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                CustomMainContainer(
                  pb: 20,
                  pt: 20,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomCharacterData(
                        titleData: AppStrings.status,
                        data: widget.character.status,
                      ),
                      CustomCharacterData(
                        titleData: AppStrings.specie,
                        data: specie,
                      ),
                      CustomCharacterData(
                        titleData: AppStrings.gender,
                        data: widget.character.gender,
                      ),
                      CustomCharacterData(
                        titleData: AppStrings.origin,
                        data: widget.character.origin.name,
                      ),
                      CustomCharacterData(
                        titleData: AppStrings.lastLocation,
                        data: widget.character.location.name,
                        bp: 0,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
