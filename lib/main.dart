import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_last_competition_apps/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsCook',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedLabelStyle: TextStyle(
            fontSize: 12,
          ),
          elevation: 0,
          selectedItemColor: Colors.redAccent,
          showSelectedLabels: true,
          showUnselectedLabels: false,
        ),
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.redAccent,
      ),
      home: const MainScreen(),
    );
  }
}
