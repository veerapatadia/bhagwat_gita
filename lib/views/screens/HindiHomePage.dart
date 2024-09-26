import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jsonbhagwatgita/provider/theme.dart';
import 'package:provider/provider.dart';

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
        title: Text(
          "श्रीमद् भगवद्गीता",
          style: TextStyle(fontSize: 23),
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
                  Navigator.of(context).pushNamed('hindi_favourite_page');
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
                            Navigator.of(context).pushNamed('hindi_detail_page',
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
                                        : Colors.white.withOpacity(0.1),
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
                                        "${allData[i]['name']}",
                                        style: TextStyle(
                                          fontSize: 25,
                                          // color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "अध्याय संख्या: ${allData[i]['chapter_number_hindi']}",
                                        style: TextStyle(
                                          fontSize: 18,
                                          // color: Colors.white,
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
