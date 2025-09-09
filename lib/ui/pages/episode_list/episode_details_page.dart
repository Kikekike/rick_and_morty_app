import 'package:flutter/material.dart';
import 'package:rickandmortyapp/constants/strings.dart';
import 'package:rickandmortyapp/models/episode_model.dart';
import 'package:rickandmortyapp/ui/components/residents_component.dart';
import 'package:rickandmortyapp/ui/layout/base_layout.dart';
import 'package:rickandmortyapp/ui/widgets/custom_character_data.dart';
import 'package:rickandmortyapp/ui/widgets/custom_main_container.dart';
import 'package:rickandmortyapp/ui/widgets/custom_principal_text.dart';

class EpisodeDetailsPage extends StatefulWidget {
  final EpisodeModel episode;

  const EpisodeDetailsPage({super.key, required this.episode});

  @override
  State<EpisodeDetailsPage> createState() => _EpisodeDetailsPageState();
}

class _EpisodeDetailsPageState extends State<EpisodeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      showBackButton: true,
      tp: 12,
      bp: 24,
      title: AppStrings.episodeDetailsTitle,
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
                  text: "#${widget.episode.id} ${widget.episode.name}",
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              CustomMainContainer(
                pb: 5,
                pt: 18,
                mb: 8,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCharacterData(
                      titleData: AppStrings.airDate,
                      data: widget.episode.airDate,
                    ),
                    CustomCharacterData(
                      titleData: AppStrings.episode,
                      data: widget.episode.episode,
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
                        text: "${AppStrings.characterInEpisode} :",
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ResidentsComponent(residentIds: widget.episode.characters)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
