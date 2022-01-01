import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:the_last_competition_apps/main_screen.dart';

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
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          
        ),
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.redAccent,
      ),
      home: const MainScreen(),
    );
  }
}
