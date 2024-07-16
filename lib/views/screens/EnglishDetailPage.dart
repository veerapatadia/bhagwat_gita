import 'package:flutter/material.dart';

class EnglishDetailPage extends StatefulWidget {
  const EnglishDetailPage({super.key});

  @override
  State<EnglishDetailPage> createState() => _EnglishDetailPageState();
}

class _EnglishDetailPageState extends State<EnglishDetailPage> {
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text("${data['name_translation']}"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 400,
                color: Colors.red,
                child: Column(
                  children: [
                    Row(
                      children: [Text("Chapter No: ${data['chapter_number']}")],
                    ),
                    Row(
                      children: [
                        Text("Chapter Name: ${data['name_transliterated']}")
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 400,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 450,
                  width: 400,
                  color: Colors.red,
                  child: Text(
                    "${data['chapter_summary']}",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
