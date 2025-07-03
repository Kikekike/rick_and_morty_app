import 'package:flutter/material.dart';
import 'package:rickandmortyapp/ui/components/custom_top_nav_bar.dart';
import 'package:rickandmortyapp/ui/pages/characters_list_page.dart';
import 'package:rickandmortyapp/ui/pages/home_page.dart';
import 'package:rickandmortyapp/ui/widgets/custom_principal_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        // useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: const HomePage(),
    );
  }
}
