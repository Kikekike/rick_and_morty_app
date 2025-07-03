import 'package:flutter/material.dart';
import 'package:rickandmortyapp/ui/layout/base_layout.dart';

class LocationsListPage extends StatefulWidget {
  const LocationsListPage({Key? key}) : super(key: key);

  @override
  State<LocationsListPage> createState() => _LocationsListPageState();
}

class _LocationsListPageState extends State<LocationsListPage> {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title: "Locations List",
        showBackButton: true,
        bp: 10,
        child: Container());
  }
}
