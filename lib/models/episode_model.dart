import 'package:rickandmortyapp/constants/strings.dart';

class EpisodeModel {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;
  final String url;
  final String created;

  EpisodeModel({
    this.id = -1,
    this.name = AppStrings.wordUnknownEpisode,
    this.airDate = AppStrings.wordUnknown,
    this.episode = AppStrings.wordNumberUnknownEpisode,
    this.characters = const [],
    this.url = AppStrings.emptySpace,
    this.created = AppStrings.emptySpace,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      id: int.tryParse(json['id'].toString()) ?? -1,
      name: json['name'] ?? AppStrings.wordUnknownEpisode,
      airDate: json['air_date'] ?? AppStrings.wordUnknown,
      episode: json['episode'] ?? AppStrings.wordNumberUnknownEpisode,
      characters: (json['characters'] as List<dynamic>?)
              ?.map((c) => c.toString())
              .toList() ??
          [],
      url: json['url'] ?? "",
      created: json['created'] ?? "",
    );
  }
}
