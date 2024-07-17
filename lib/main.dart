import 'package:flutter/material.dart';
import 'package:jsonbhagwatgita/views/screens/EnglishDetailPage.dart';
import 'package:jsonbhagwatgita/views/screens/HindiDetailPage.dart';
import 'package:jsonbhagwatgita/views/screens/HindiHomePage.dart';
import 'package:jsonbhagwatgita/views/screens/EnglishHomePage.dart';
import 'package:jsonbhagwatgita/views/screens/LanguagePage.dart';
import 'package:jsonbhagwatgita/views/screens/SplashPage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => splashscreen(),
        'language_page': (context) => LanguagePage(),
        'english_home_page': (context) => EnglishHomePage(),
        'english_detail_page': (context) => EnglishDetailPage(),
        'hindi_home_page': (context) => HindiHomePage(),
        'hindi_detail_page': (context) => HindiDetailPage(),
      },
    ),
  );
}
