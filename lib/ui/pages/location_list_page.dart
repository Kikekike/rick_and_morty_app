import 'package:flutter/material.dart';
import 'package:rickandmortyapp/ui/layout/base_layout.dart';

class LocationListPage extends StatefulWidget {
  const LocationListPage({Key? key}) : super(key: key);

  @override
  State<LocationListPage> createState() => _LocationListPageState();
}

class _LocationListPageState extends State<LocationListPage> {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title: "Location List",
        showBackButton: true,
        bp: 10,
        child: Container());
  }
}
