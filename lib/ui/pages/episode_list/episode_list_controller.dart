import 'package:flutter/material.dart';
import 'package:rickandmortyapp/models/episode_model.dart';
import 'package:rickandmortyapp/services/episode_service.dart';

class EpisodeListController extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  List<EpisodeModel> episodes = [];
  int _currentPage = 1;
  bool isLoading = false;
  bool hasMore = true;
  bool hasError = false;
  bool hasSearched = false;

  EpisodeListController() {
    fetchEpisodes();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200 &&
        !isLoading &&
        hasMore) {
      fetchEpisodes();
    }
  }

  Future<void> searchEpisodes() async {
    hasSearched = true;
    episodes.clear();
    _currentPage = 1;
    hasMore = true;
    notifyListeners();
    await fetchEpisodes();
  }

  Future<void> fetchEpisodes() async {
    isLoading = true;
    hasError = false;
    notifyListeners();

    try {
      final input = searchController.text.trim();
      final isCode = RegExp(r'^S\d{2}E\d{2}$').hasMatch(input);

      final newEpisodes = await EpisodeService.fetchEpisodes(
        page: _currentPage,
        name: isCode ? null : input,
        code: isCode ? input : null,
      );

      episodes.addAll(newEpisodes);
      episodes = {
        for (var e in episodes) e.id: e,
      }.values.toList();

      _currentPage++;
      hasMore = newEpisodes.isNotEmpty;
    } catch (e) {
      debugPrint("Error fetching episodes: $e");
      hasError = true;
      hasMore = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void disposeController() {
    scrollController.dispose();
    searchController.dispose();
  }
}
