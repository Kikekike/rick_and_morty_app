import 'package:rickandmortyapp/models/origin_location_model.dart';
import 'package:rickandmortyapp/theme/app_images.dart';

class CharacterModel {
  final int id;
  final String imagePath;
  final String name;
  final String species;
  final String status;
  final String type;
  final String gender;
  final OriginLocationModel origin;
  final OriginLocationModel location;
  final List<String> episodes;
  final String url;
  final String created;

  CharacterModel({
    this.id = -1,
    this.imagePath = AppImages.homeOne,
    this.name = "Character Name",
    this.species = "Human",
    this.status = "Alive",
    this.type = "",
    this.gender = "",
    this.origin = const OriginLocationModel(),
    this.location = const OriginLocationModel(),
    this.episodes = const [],
    this.url = "",
    this.created = "",
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      imagePath: json['image'],
      name: json['name'],
      species: json['species'],
      status: json['status'],
      type: json['type'] ?? "",
      gender: json['gender'] ?? "",
      origin: OriginLocationModel.fromJson(json['origin'] ?? {}),
      location: OriginLocationModel.fromJson(json['location'] ?? {}),
      episodes: List<String>.from(json['episode'] ?? []),
      url: json['url'] ?? "",
      created: json['created'] ?? "",
    );
  }
}
