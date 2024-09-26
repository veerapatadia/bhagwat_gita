import 'package:flutter/material.dart';
import 'package:jsonbhagwatgita/provider/favouriteprovider.dart';
import 'package:jsonbhagwatgita/provider/theme.dart';
import 'package:jsonbhagwatgita/views/screens/EnglishDetailPage.dart';
import 'package:jsonbhagwatgita/views/screens/EnglishFavouritePage.dart';
import 'package:jsonbhagwatgita/views/screens/EnglishShlokDetailPage.dart';
import 'package:jsonbhagwatgita/views/screens/EnglishShlokPage.dart';
import 'package:jsonbhagwatgita/views/screens/HindiDetailPage.dart';
import 'package:jsonbhagwatgita/views/screens/HindiFavouritePage.dart';
import 'package:jsonbhagwatgita/views/screens/HindiHomePage.dart';
import 'package:jsonbhagwatgita/views/screens/EnglishHomePage.dart';
import 'package:jsonbhagwatgita/views/screens/HindiShlokDetailPage.dart';
import 'package:jsonbhagwatgita/views/screens/HindiShlokPage.dart';
import 'package:jsonbhagwatgita/views/screens/LanguagePage.dart';
import 'package:jsonbhagwatgita/views/screens/SplashPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => FavoritesProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: (Provider.of<ThemeProvider>(context).istap)
          ? ThemeMode.dark
          : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => splashscreen(),
        'language_page': (context) => LanguagePage(),
        'english_home_page': (context) => EnglishHomePage(),
        'english_detail_page': (context) => EnglishDetailPage(),
        'english_favourite_page': (context) => EnglishFavoritePage(),
        'hindi_home_page': (context) => HindiHomePage(),
        'hindi_detail_page': (context) => HindiDetailPage(),
        'hindi_shlok_page': (context) => HindiShlokPage(),
        'hindi_favourite_page': (context) => HindiFavoritePage(),
        'hindi_shlok_detail_page': (context) => HindiShlokDetailPage(),
        'english_shlok_page': (context) => EnglishShlokPage(),
        'english_shlok_detail_page': (context) => EnglishShlokDetailPage(),
      },
    );
  }
}
