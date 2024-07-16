import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('hindi_home_page');
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: 400,
                  color: Colors.red,
                  child: Text("Hindi"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('english_home_page');
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: 400,
                  color: Colors.red,
                  child: Text("English"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
