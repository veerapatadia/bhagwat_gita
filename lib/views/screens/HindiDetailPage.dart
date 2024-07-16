import 'package:flutter/material.dart';

class HindiDetailPage extends StatefulWidget {
  const HindiDetailPage({super.key});

  @override
  State<HindiDetailPage> createState() => _HindiDetailPageState();
}

class _HindiDetailPageState extends State<HindiDetailPage> {
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text("${data['name']}"),
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
                      children: [Text("Adhay Naam: ${data['name']}")],
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
                    "${data['chapter_summary_hindi']}",
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
