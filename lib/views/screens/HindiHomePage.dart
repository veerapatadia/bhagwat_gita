import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HindiHomePage extends StatefulWidget {
  const HindiHomePage({super.key});

  @override
  State<HindiHomePage> createState() => _HindiHomePageState();
}

class _HindiHomePageState extends State<HindiHomePage> {
  late Future<String> jsonData;

  void loadJson() {
    jsonData = rootBundle.loadString("assets/data/alldata.json");
  }

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bhagwat Gita"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: jsonData,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Center(
              child: Text("ERROR : ${snapshot.hasError}"),
            );
          } else if (snapshot.hasData) {
            String? data = snapshot.data;
            List allData = (data == null) ? [] : jsonDecode(data);
            return (data == null)
                ? Center(
                    child: Text("No data available"),
                  )
                : ListView.builder(
                    itemCount: allData.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('hindi_detail_page',
                                arguments: allData[i]);
                          },
                          child: Container(
                            height: 170,
                            width: 300,
                            color: Colors.black.withOpacity(0.5),
                            child: Column(
                              children: [
                                Text(
                                  "${allData[i]['chapter_number']}",
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  "${allData[i]['name']}",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
