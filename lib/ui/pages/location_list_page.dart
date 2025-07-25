import 'package:flutter/material.dart';
import 'package:rickandmortyapp/constants/strings.dart';
import 'package:rickandmortyapp/models/location_model.dart';
import 'package:rickandmortyapp/services/location_service.dart';
import 'package:rickandmortyapp/theme/app_colors.dart';
import 'package:rickandmortyapp/ui/components/custom_search_bar/custom_search_bar.dart';
import 'package:rickandmortyapp/ui/components/location_card.dart';
import 'package:rickandmortyapp/ui/layout/base_layout.dart';
import 'package:rickandmortyapp/ui/widgets/custom_principal_text.dart';

class LocationListPage extends StatefulWidget {
  const LocationListPage({Key? key}) : super(key: key);

  @override
  State<LocationListPage> createState() => _LocationListPageState();
}

class _LocationListPageState extends State<LocationListPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  List<LocationModel> _locations = [];
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;
  bool _hasError = false;
  bool _hasSearched = false;

  @override
  void initState() {
    super.initState();
    _fetchLocations();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !_isLoading &&
          _hasMore) {
        _fetchLocations();
      }
    });
  }

  Future<void> _searchLocations() async {
    setState(() {
      _hasSearched = true;
      _locations.clear();
      _currentPage = 1;
      _hasMore = true;
    });
    await _fetchLocations();
  }

  Future<void> _fetchLocations() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });
    try {
      final response = await LocationService.fetchLocationsByName(
        name: _searchController.text,
        page: _currentPage,
      );

      final newLocations = response['locations'] as List<LocationModel>;
      final hasNextPage = response['hasNextPage'] as bool;

      setState(() {
        _locations.addAll(newLocations);
        _currentPage++;
        _hasMore = hasNextPage;
      });
    } catch (e) {
      debugPrint("Error fetching locations: $e");
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
      title: "Location List",
      showBackButton: true,
      bp: 10,
      tp: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomSearchBar(
            hasStatus: false,
            controller: _searchController,
            onSearchChanged: (value) {
              _searchLocations();
            },
            hintText: AppStrings.searchHintLocation,
          ),
          Expanded(
            child:
                _hasSearched && !_isLoading && (_hasError || _locations.isEmpty)
                    ? const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: CustomPrincipalText(
                          text: AppStrings.oopsError,
                          color: Colors.white,
                        ),
                      )
                    : ListView.builder(
                        controller: _scrollController,
                        itemCount: _locations.length + (_isLoading ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index < _locations.length) {
                            return LocationCard(location: _locations[index]);
                          } else {
                            return const Padding(
                              padding: EdgeInsets.all(16),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.titleTextColor,
                                ),
                              ),
                            );
                          }
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
