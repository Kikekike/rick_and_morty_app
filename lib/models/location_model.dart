import 'package:rickandmortyapp/constants/strings.dart';

class LocationModel {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final String created;

  LocationModel({
    this.id = -1,
    this.name = AppStrings.wordUnknownLocation,
    this.type = AppStrings.wordUnknown,
    this.dimension = AppStrings.wordUnknown,
    this.residents = const [],
    this.url = AppStrings.emptySpace,
    this.created = AppStrings.emptySpace,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: int.tryParse(json['id'].toString()) ?? -1,
      name: json['name'] ?? "Unknown Location",
      type: json['type'] ?? "Unknown",
      dimension: json['dimension'] ?? "Unknown",
      residents: (json['residents'] as List<dynamic>?)
              ?.map((r) => r['id'].toString())
              .toList() ??
          [],
      url: json['url'] ?? "",
      created: json['created'] ?? "",
    );
  }
}
