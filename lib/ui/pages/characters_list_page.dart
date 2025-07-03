import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rickandmortyapp/models/character_model.dart';
import 'package:rickandmortyapp/services/character_service.dart';
import 'package:rickandmortyapp/theme/app_colors.dart';
import 'package:rickandmortyapp/ui/components/character_card.dart';
import 'package:rickandmortyapp/ui/layout/base_layout.dart';

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({Key? key}) : super(key: key);

  @override
  State<CharactersListPage> createState() => _CharactersListPageState();
}

class _CharactersListPageState extends State<CharactersListPage> {
  final ScrollController _scrollController = ScrollController();
  List<CharacterModel> _characters = [];
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _fetchCharacters();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !_isLoading &&
          _hasMore) {
        _fetchCharacters();
      }
    });
  }

  Future<void> _fetchCharacters() async {
    setState(() => _isLoading = true);
    try {
      final newCharacters =
          await CharacterService.fetchCharacters(_currentPage);
      setState(() {
        _characters.addAll(newCharacters);
        _currentPage++;
        if (newCharacters.length < 20) _hasMore = false;
      });
    } catch (e) {
      debugPrint("Error fetching characters: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title: "Characters List",
        showBackButton: true,
        bp: 10,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _characters.length + (_isLoading ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < _characters.length) {
              return CharacterCard(character: _characters[index]);
            } else {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                    child: CircularProgressIndicator(
                  color: AppColors.titleTextColor,
                )),
              );
            }
          },
        ));
  }
}
