import 'package:flutter/material.dart';
import 'package:rickandmortyapp/constants/strings.dart';
import 'package:rickandmortyapp/models/character_model.dart';
import 'package:rickandmortyapp/services/character_graphql_service.dart';
import 'package:rickandmortyapp/theme/app_colors.dart';
import 'package:rickandmortyapp/ui/components/character_card.dart';
import 'package:rickandmortyapp/ui/widgets/custom_principal_text.dart';
import 'package:rickandmortyapp/ui/widgets/custom_separator.dart';

class ResidentsComponent extends StatelessWidget {
  final List<String> residentIds;

  const ResidentsComponent({super.key, required this.residentIds});

  Future<List<CharacterModel>> _fetchCharacters() async {
    final List<int> ids = residentIds
        .map((id) {
          if (id is int) return id;
          final idStr = id.toString();
          if (idStr.contains('/')) {
            return int.tryParse(idStr.split('/').last);
          }
          return int.tryParse(idStr);
        })
        .whereType<int>()
        .toList();
    if (ids.isEmpty) return [];
    return await CharacterGraphqlService.fetchCharactersByIds(ids);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CharacterModel>>(
      future: _fetchCharacters(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(
                child: CircularProgressIndicator(
              color: AppColors.cardTitleColor,
            )),
          );
        } else if (snapshot.hasError) {
          return const CustomPrincipalText(
            text: AppStrings.oopsErrorResidents,
            color: Colors.white,
          );
        } else if (snapshot.data == null || snapshot.data!.isEmpty) {
          return const CustomPrincipalText(
            text: AppStrings.noResidentsFound,
            color: Colors.white,
          );
        } else {
          final characters = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final character = characters[index];
              return Column(
                children: [
                  CharacterCard(
                    character: character,
                    hasBorder: false,
                  ),
                  const SizedBox(height: 5),
                  const CustomSeparator(),
                  const SizedBox(height: 15),
                ],
              );
            },
          );
        }
      },
    );
  }
}
