import 'package:flutter/material.dart';
import 'package:rickandmortyapp/models/episode_model.dart';
import 'package:rickandmortyapp/theme/app_text_styles.dart';
import 'package:rickandmortyapp/ui/pages/episode_list/episode_details_page.dart';
import 'package:rickandmortyapp/ui/widgets/auto_scroll_text.dart';
import 'package:rickandmortyapp/ui/widgets/custom_main_container.dart';
import 'package:rickandmortyapp/ui/widgets/custom_principal_text.dart';
import 'package:rickandmortyapp/ui/widgets/custom_separator.dart';

class EpisodeCard extends StatelessWidget {
  final EpisodeModel episode;

  const EpisodeCard({required this.episode, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EpisodeDetailsPage(episode: episode),
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
                text: "#${episode.id} ${episode.name}",
                style: AppTextStyles.principalWith(
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 5),
              const CustomSeparator(),
              const SizedBox(height: 5),
              CustomPrincipalText(
                text: "Air date: ${episode.airDate}",
                color: Colors.white,
                fontSize: 12,
              ),
              CustomPrincipalText(
                text: "Code: ${episode.episode}",
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
