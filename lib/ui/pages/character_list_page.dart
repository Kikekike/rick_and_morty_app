import 'package:flutter/material.dart';
import 'package:rickandmortyapp/constants/strings.dart';
import 'package:rickandmortyapp/models/character_model.dart';
import 'package:rickandmortyapp/services/character_service.dart';
import 'package:rickandmortyapp/theme/app_colors.dart';
import 'package:rickandmortyapp/ui/components/character_card.dart';
import 'package:rickandmortyapp/ui/components/character_search_bar/character_search_bar.dart';
import 'package:rickandmortyapp/ui/layout/base_layout.dart';
import 'package:rickandmortyapp/ui/widgets/custom_principal_text.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({Key? key}) : super(key: key);

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  String _selectedStatus = AppStrings.statusAny;
  List<CharacterModel> _characters = [];
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;
  bool _hasError = false;
  bool _hasSearched = false;

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

  Future<void> _searchCharacters() async {
    setState(() {
      _hasSearched = true;
      _characters.clear();
      _currentPage = 1;
      _hasMore = true;
    });
    await _fetchCharacters();
  }

  Future<void> _fetchCharacters() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });
    try {
      final newCharacters = await CharacterService.fetchCharacters(
          page: _currentPage,
          name: _searchController.text,
          status: _selectedStatus);
      setState(() {
        _characters.addAll(newCharacters);
        _currentPage++;
        if (newCharacters.length < 20) _hasMore = false;
      });
    } catch (e) {
      debugPrint("Error fetching characters: $e");
      setState(() {
        _hasError = true;
        _hasMore = false;
      });
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
        title: "Character List",
        showBackButton: true,
        bp: 10,
        tp: 20,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CharacterSearchBar(
                controller: _searchController,
                selectedStatus: _selectedStatus,
                onSearchChanged: (value) {
                  _searchCharacters();
                },
                onStatusSelected: (value) {
                  setState(() {
                    _selectedStatus = value;
                  });
                  _searchCharacters();
                }),
            Expanded(
              child: _hasSearched &&
                      !_isLoading &&
                      (_hasError || _characters.isEmpty)
                  ? const Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: CustomPrincipalText(
                        text:
                            "Oops! We couldn't find any results. Try again later or check your search.",
                        color: Colors.white,
                      ),
                    )
                  : ListView.builder(
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
                    ),
            ),
          ],
        ));
  }
}
