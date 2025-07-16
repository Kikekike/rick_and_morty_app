import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rickandmortyapp/constants/strings.dart';
import 'package:rickandmortyapp/models/character_model.dart';
import 'package:rickandmortyapp/services/api_constants.dart';

class CharacterService {
  static Future<List<CharacterModel>> fetchCharacters(
      {required int page, String? name, String? status}) async {
    final queryParams = {
      'page': '$page',
      if (name != null && name.isNotEmpty) 'name': name,
      if (status != null && status != AppStrings.statusAny) 'status': status,
    };

    final uri =
        Uri.https(ApiConstants.baseUrlNoHttp, '/api/character', queryParams);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List results = data['results'];
      return results.map((json) => CharacterModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
