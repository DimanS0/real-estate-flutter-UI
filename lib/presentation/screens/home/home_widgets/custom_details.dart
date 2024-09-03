import 'package:flutter/material.dart';
import '../models/article.dart'; // Assuming you have this model
import 'custom_bottom_navbar.dart'; // Import the custom bottom navbar widget

class CustomDetailScreen extends StatelessWidget {
  final Article article;

  const CustomDetailScreen({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 300.0, // Height of the image
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    article.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  // Back button positioned at the top left
                  Positioned(
                    top: 40.0, // Adjust to place the icon as per your design
                    left: 16.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.black54,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Breadcrumb navigation
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text('Home'),
                      ),
                      const Text('>'),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Tips'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  // Article title and subtitle
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    article.description.first, // Display the first part of the description as the subtitle
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Full description
                  ...article.description.map((paragraph) => Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      paragraph,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(), // Add the custom bottom navigation bar
    );
  }
}
