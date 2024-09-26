import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/favouriteprovider.dart';

class HindiFavoritePage extends StatefulWidget {
  @override
  State<HindiFavoritePage> createState() => _HindiFavoritePageState();
}

class _HindiFavoritePageState extends State<HindiFavoritePage> {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Shlokas'),
      ),
      body: favoritesProvider.favorites.isEmpty
          ? Center(
              child: Text(
                'No favorite shlokas yet!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: favoritesProvider.favorites.length,
              itemBuilder: (context, index) {
                final verse = favoritesProvider.favorites[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('Verse ${verse["Sloka"]}'),
                    subtitle: Text(verse['Verse']),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        favoritesProvider.toggleFavorite(verse);
                      },
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        'hindi_shlok_detail_page',
                        arguments: verse,
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
