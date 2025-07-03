import 'package:flutter/material.dart';
import 'package:rickandmortyapp/ui/layout/base_layout.dart';

class EpisodesListPage extends StatefulWidget {
  const EpisodesListPage({Key? key}) : super(key: key);

  @override
  State<EpisodesListPage> createState() => _EpisodesListPageState();
}

class _EpisodesListPageState extends State<EpisodesListPage> {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title: "Episodes List",
        showBackButton: true,
        bp: 10,
        child: Container());
  }
}
