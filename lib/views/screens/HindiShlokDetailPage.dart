import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favouriteprovider.dart';

class HindiShlokDetailPage extends StatefulWidget {
  @override
  State<HindiShlokDetailPage> createState() => _HindiShlokDetailPageState();
}

class _HindiShlokDetailPageState extends State<HindiShlokDetailPage> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> verse =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Verse ${verse["Sloka"]} Details'),
        actions: [
          IconButton(
            icon: Icon(
              favoritesProvider.isFavorite(verse)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: favoritesProvider.isFavorite(verse)
                  ? Colors.red
                  : Colors.deepPurple,
            ),
            onPressed: () {
              favoritesProvider.toggleFavorite(verse);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verse ${verse["Sloka"]}:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16),
            Text(
              verse['Verse'],
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              'Translation (Hindi):',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text(
              verse['Translation_Hindi'],
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
