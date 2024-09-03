import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../provider/favorite_provider.dart';
import '../models/article.dart';
import 'custom_details.dart';


class RecommendedCard extends StatelessWidget {
  final Article article;

  const RecommendedCard({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return GestureDetector(
      onTap: () {
        // Navigate to Detail Screen with the selected article
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomDetailScreen(article: article),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        width: 300,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(article.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Semi-transparent overlay for better text visibility
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.black54,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Article Number and Title
            Positioned(
              bottom: 0,
              left: 20,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.articleNumber,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      article.title,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bookmark and Favorite Buttons Wrapped in Smaller Horizontal Containers
            Positioned(
              top: 10.0,
              right: 10.0,
              child: Row(
                children: [
                  Container(
                    width: 25.0,
                    height: 25.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.bookmark, size: 12.0),
                      color: Colors.black,
                      onPressed: () {
                        // Bookmark logic will go here
                      },
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Container(
                    width: 25.0,
                    height: 25.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        size: 12.0,
                        color: favoritesProvider.isFavorite(article)
                            ? Colors.red
                            : Colors.black,
                      ),
                      onPressed: () {
                        if (favoritesProvider.isFavorite(article)) {
                          favoritesProvider.removeFavorite(article);
                        } else {
                          favoritesProvider.addFavorite(article);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
