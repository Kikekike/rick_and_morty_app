import 'package:rickandmortyapp/theme/app_images.dart';

class CharacterModel {
  final int id;
  final String imagePath;
  final String name;
  final String species;
  final String status;

  CharacterModel({
    this.id = -1,
    this.imagePath = AppImages.homeOne,
    this.name = "Character Name",
    this.species = "Human",
    this.status = "Alive",
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      imagePath: json['image'],
      name: json['name'],
      species: json['species'],
      status: json['status'],
    );
  }
}
