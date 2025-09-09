import 'package:rickandmortyapp/constants/strings.dart';

class OriginLocationModel {
  final String name;
  final String url;

  const OriginLocationModel(
      {this.name = AppStrings.statusUnknown, this.url = AppStrings.emptySpace});

  factory OriginLocationModel.fromJson(Map<String, dynamic> json) {
    return OriginLocationModel(
        name: json['name'] ?? AppStrings.statusUnknown, url: json['url'] ?? "");
  }
}
