import 'package:flutter/material.dart';

import 'components/header.dart';
import 'components/navigation.dart';
import 'components/catcalculator.dart';
import 'components/dogcalculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Age Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            textStyle: const TextStyle(
              color: Color(0xff000072),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff000072),
            textStyle: const TextStyle(color: Colors.white),
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Color(0xff000072),
          ),
        ),
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  String currentPage = 'cat';

  setPage(page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        children: [
          Header(
            heroImage: currentPage == 'cat'
                ? 'assets/images/cat.png'
                : 'assets/images/dog.png',
            petType: currentPage,
            backgroudColor: currentPage == 'cat' ? 0xFFFFC76C : 0xffFC9A9A,
          ),
          Navigation(pageSetter: setPage, currentPage: currentPage),
          currentPage == 'cat' ? const CatCalculator() : const DogCalculator()
        ],
      ),
    );
  }
}
