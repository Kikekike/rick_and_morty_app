import 'package:flutter/material.dart';
import 'package:rickandmortyapp/ui/layout/base_layout.dart';

class EpisodeListPage extends StatefulWidget {
  const EpisodeListPage({Key? key}) : super(key: key);

  @override
  State<EpisodeListPage> createState() => _EpisodeListPageState();
}

class _EpisodeListPageState extends State<EpisodeListPage> {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title: "Episode List",
        showBackButton: true,
        bp: 10,
        child: Container());
  }
}
