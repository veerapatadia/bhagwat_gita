import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/font/font.png',
              height: 700,
              width: 400,
            ),
            SizedBox(height: 20),
            Card(
              color: Colors.black,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('hindi_home_page');
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 65,
                  width: 400,
                  child: Text(
                    "Hindi",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              color: Colors.black,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('english_home_page');
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 65,
                  width: 400,
                  child: Text(
                    "English",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
