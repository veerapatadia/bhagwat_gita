import 'package:flutter/material.dart';

class HindiDetailPage extends StatefulWidget {
  const HindiDetailPage({Key? key}) : super(key: key);

  @override
  State<HindiDetailPage> createState() => _HindiDetailPageState();
}

class _HindiDetailPageState extends State<HindiDetailPage> {
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back_ios),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 90, top: 5),
                        child: Text(
                          "श्रीमद् भगवद्गीता",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed('hindi_shlok_page', arguments: data);
                          },
                          icon: Icon(Icons.temple_hindu_sharp),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 390,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage("${data['image_name']}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "अध्याय संख्या: ${data['chapter_number_hindi']}",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "अध्याय का नाम: ${data['name']}",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 10, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${data['chapter_summary_hindi']}",
                      style: TextStyle(height: 2, fontSize: 17),
                    ),
                    SizedBox(height: 10),
                    // Text(
                    //   "Shlokas",
                    //   style: TextStyle(height: 2, fontSize: 17),
                    // ),
                    // SizedBox(height: 10),
                    // Text(
                    //   "${data['shlok']}",
                    //   style: TextStyle(height: 2, fontSize: 17),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
