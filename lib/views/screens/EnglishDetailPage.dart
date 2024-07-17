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
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://i.pinimg.com/736x/49/78/f5/4978f52d2c27aad79fb4a90c98b2b303.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 899,
                  width: 405,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.7),
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.5),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 20),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      size: 20,
                                    ),
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 35),
                                    child: Text(
                                      "Shreemad Bhagwat Geeta",
                                      style: TextStyle(
                                          fontSize: 21, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 400,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.6),
                              Colors.transparent,
                            ],
                          ),
                          image: DecorationImage(
                            image: NetworkImage("${data['image_name']}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Chapter No: ${data['chapter_number']}",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Chapter Name: ${data['name_translation']}",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Column(
                            children: [
                              Text(
                                "${data['chapter_summary']}",
                                style: TextStyle(
                                    height: 2,
                                    color: Colors.white,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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

//
//
