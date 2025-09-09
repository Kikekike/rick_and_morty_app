import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rickandmortyapp/models/episode_model.dart';
import 'package:rickandmortyapp/services/api_constants.dart';

class EpisodeService {
  static Future<List<EpisodeModel>> fetchEpisodes({
    required int page,
    String? name,
    String? code,
  }) async {
    final queryParams = {
      'page': '$page',
      if (name != null && name.isNotEmpty) 'name': name,
      if (code != null && code.isNotEmpty) 'episode': code,
    };

    final uri =
        Uri.https(ApiConstants.baseUrlNoHttp, '/api/episode', queryParams);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List results = data['results'];
      return results.map((json) => EpisodeModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load episodes');
    }
  }
}
