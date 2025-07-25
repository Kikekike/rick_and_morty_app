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
    this.name = "Unknown Location",
    this.type = "Unknown",
    this.dimension = "Unknown",
    this.residents = const [],
    this.url = "",
    this.created = "",
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
