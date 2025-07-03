import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rickandmortyapp/models/character_model.dart';
import 'package:rickandmortyapp/services/api_constants.dart';

class CharacterService {
  static Future<List<CharacterModel>> fetchCharacters(int page) async {
    final url = Uri.parse('${ApiConstants.baseUrl}/character?page=$page');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List results = data['results'];
      return results.map((json) => CharacterModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
