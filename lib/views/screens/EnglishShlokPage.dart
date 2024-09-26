import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class EnglishShlokPage extends StatefulWidget {
  @override
  _EnglishShlokPageState createState() => _EnglishShlokPageState();
}

class _EnglishShlokPageState extends State<EnglishShlokPage> {
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
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: selectedChapterVerses.length,
                itemBuilder: (context, index) {
                  final verse = selectedChapterVerses[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        'english_shlok_detail_page',
                        arguments: verse,
                      );
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Verse ${verse["Sloka"]}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              verse['Verse'],
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
