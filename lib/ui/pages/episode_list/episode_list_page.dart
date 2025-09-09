import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'episode_list_controller.dart';
import 'package:rickandmortyapp/constants/strings.dart';
import 'package:rickandmortyapp/theme/app_colors.dart';
import 'package:rickandmortyapp/ui/components/custom_search_bar/custom_search_bar.dart';
import 'package:rickandmortyapp/ui/components/episode_card.dart';
import 'package:rickandmortyapp/ui/layout/base_layout.dart';
import 'package:rickandmortyapp/ui/widgets/custom_principal_text.dart';

class EpisodeListPage extends StatelessWidget {
  const EpisodeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Provider.of<EpisodeListController>(context, listen: false);

    return BaseLayout(
      title: AppStrings.episodeListTitle,
      showBackButton: true,
      bp: 10,
      tp: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomSearchBar(
            hasStatus: false,
            controller: controller.searchController,
            onSearchChanged: (value) {
              controller.searchEpisodes();
            },
            hintText: AppStrings.searchHintEpisode,
          ),
          Consumer<EpisodeListController>(
            builder: (context, controller, _) {
              if (controller.hasSearched &&
                  !controller.isLoading &&
                  (controller.hasError || controller.episodes.isEmpty)) {
                return const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: CustomPrincipalText(
                    text: AppStrings.oopsError,
                    color: Colors.white,
                  ),
                );
              }
              return Expanded(
                child: ListView.builder(
                  controller: controller.scrollController,
                  itemCount: controller.episodes.length +
                      (controller.isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < controller.episodes.length) {
                      return EpisodeCard(
                        episode: controller.episodes[index],
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.titleTextColor,
                          ),
                        ),
                      );
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
