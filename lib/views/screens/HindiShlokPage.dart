import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class HindiShlokPage extends StatefulWidget {
  @override
  _HindiShlokPageState createState() => _HindiShlokPageState();
}

class _HindiShlokPageState extends State<HindiShlokPage> {
  List<dynamic> chapters = [];
  List<dynamic> selectedChapterVerses = [];

  @override
  void initState() {
    super.initState();
    loadShlokas();
  }

  Future<void> loadShlokas() async {
    String jsonString = await rootBundle.loadString('assets/data/alldata.json');
    setState(() {
      chapters = json.decode(jsonString);

      final args = ModalRoute.of(context)!.settings.arguments as Map;
      final chapterNumber = args['chapter_number'];

      selectedChapterVerses = chapters.firstWhere(
        (chapter) => chapter['chapter_number'] == chapterNumber,
        orElse: () => {},
      )['verses'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shlokas'),
      ),
      body: selectedChapterVerses.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: selectedChapterVerses.length,
              itemBuilder: (context, index) {
                final verse = selectedChapterVerses[index];
                return ListTile(
                  subtitle: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Text(
                          'Verse ${verse["Sloka"]}:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          verse['Verse'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Translation (Hindi): ${verse["Translation_Hindi"]}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
