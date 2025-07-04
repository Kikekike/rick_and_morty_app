import 'package:flutter/material.dart';
import 'package:rickandmortyapp/models/character_model.dart';
import 'package:rickandmortyapp/theme/app_text_styles.dart';
import 'package:rickandmortyapp/ui/widgets/auto_scroll_text.dart';
import 'package:rickandmortyapp/ui/widgets/custom_circle_image_container.dart';
import 'package:rickandmortyapp/ui/widgets/custom_main_container.dart';
import 'package:rickandmortyapp/ui/widgets/custom_principal_text.dart';
import 'package:rickandmortyapp/ui/widgets/status_indicator.dart';

class CharacterCard extends StatelessWidget {
  final CharacterModel character;

  const CharacterCard({
    required this.character,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomMainContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                CustomCircleImageContainer(
                  image: character.imagePath,
                  size: 50,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AutoScrollText(
                        text: character.name + " #${character.id}",
                        style: AppTextStyles.principalWith(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      CustomPrincipalText(
                        text: character.species,
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          StatusIndicator(status: character.status)
        ],
      ),
    );
  }
}
