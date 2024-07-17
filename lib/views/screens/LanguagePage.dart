import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/theme.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Switch(
                    value: Provider.of<ThemeProvider>(context).istap,
                    onChanged: (val) {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .changetheme(val);
                    },
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/font/font.png',
                  height: 700,
                  width: 400,
                ),
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
          ],
        ),
      ),
    );
  }
}
