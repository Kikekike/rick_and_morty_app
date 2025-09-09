import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmortyapp/constants/strings.dart';
import 'package:rickandmortyapp/theme/app_images.dart';
import 'package:rickandmortyapp/ui/components/home_card_button.dart';
import 'package:rickandmortyapp/ui/layout/base_layout.dart';
import 'package:rickandmortyapp/ui/pages/character_list_page.dart';
import 'package:rickandmortyapp/ui/pages/episode_list/episode_list_controller.dart';
import 'package:rickandmortyapp/ui/pages/episode_list/episode_list_page.dart';
import 'package:rickandmortyapp/ui/pages/location_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title: AppStrings.homeTitle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HomeCardButton(
              title: AppStrings.characters,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CharacterListPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 25),
            HomeCardButton(
              title: AppStrings.locations,
              imagePath: AppImages.homeTwo,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LocationListPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 25),
            HomeCardButton(
              title: AppStrings.episodes,
              imagePath: AppImages.homeThree,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider(
                      create: (_) => EpisodeListController(),
                      child: const EpisodeListPage(),
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
