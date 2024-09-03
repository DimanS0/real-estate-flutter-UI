import 'package:flutter/material.dart';

import '../presentation/screens/home/models/article.dart';


class FavoritesProvider with ChangeNotifier {
  final List<Article> _favorites = [];

  List<Article> get favorites => _favorites;

  bool isFavorite(Article article) {
    return _favorites.contains(article);
  }

  void addFavorite(Article article) {
    _favorites.add(article);
    notifyListeners();
  }

  void removeFavorite(Article article) {
    _favorites.remove(article);
    notifyListeners();
  }
}
