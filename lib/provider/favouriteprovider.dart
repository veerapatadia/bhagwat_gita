import 'package:flutter/material.dart';

class FavoritesProvider with ChangeNotifier {
  List<Map<String, dynamic>> favorites = [];

  void toggleFavorite(Map<String, dynamic> verse) {
    if (favorites.contains(verse)) {
      favorites.remove(verse);
    } else {
      favorites.add(verse);
    }
    notifyListeners();
  }

  bool isFavorite(Map<String, dynamic> verse) {
    return favorites.contains(verse);
  }
}
