import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../provider/theme.dart';

class EnglishHomePage extends StatefulWidget {
  const EnglishHomePage({super.key});

  @override
  State<EnglishHomePage> createState() => _EnglishHomePageState();
}

class _EnglishHomePageState extends State<EnglishHomePage> {
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
        title: Text(
          "Shreemad Bhagwat Gita",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Switch(
                value: Provider.of<ThemeProvider>(context).istap,
                onChanged: (val) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .changetheme(val);
                },
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('english_favourite_page');
                },
                icon: Icon(
                  Icons.favorite,
                ),
              ),
            ],
          ),
        ],
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: jsonData,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR : ${snapshot.error}"),
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
                            Navigator.of(context).pushNamed(
                                'english_detail_page',
                                arguments: allData[i]);
                          },
                          child: Container(
                            height: 200,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(
                                  "${allData[i]['image_name']}",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: (Provider.of<ThemeProvider>(context)
                                            .istap)
                                        ? Colors.black.withOpacity(0.6)
                                        : Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 20, top: 20, left: 10),
                                      child: Text(
                                        "${allData[i]['name_meaning']}",
                                        style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Chapter No: ${allData[i]['chapter_number']}",
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
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
