import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Set the height of the top container
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/home3.png'), // Replace with your image path
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea( // To avoid overlap with status bar
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Text
              const Text(
                'Search and Explore',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 3), // Slight space between the title and subtitle
              Text(
                'Get knowledge and great design',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30), // Space between text and icons
              // Row for Menu, Search Bar, and Filter
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Menu Button inside a small white container
                  _buildIconContainer(
                    CupertinoIcons.bars,
                    onPressed: () {
                      // Handle menu button press
                    },
                  ),
                  const SizedBox(width: 8), // Small space between menu and search bar
                  // Minimized Search Bar inside a smaller container
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20), // Reduced radius
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const Row(
                        children: [
                          Icon(CupertinoIcons.search, color: Colors.grey),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration.collapsed(
                                hintText: 'Search...',
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8), // Small space between search bar and filter button
                  // Filter Button inside a small white container
                  _buildIconContainer(
                    CupertinoIcons.slider_horizontal_3,
                    onPressed: () {
                      // Handle filter button press
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build small white containers for the icons
  Widget _buildIconContainer(IconData iconData, {required VoidCallback onPressed}) {
    return Container(
      height: 35, // Standard height
      width: 35,  // Standard width
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8), // Reduced radius
      ),
      child: IconButton(
        padding: EdgeInsets.zero, // Remove padding to bring icons closer
        onPressed: onPressed,
        icon: Icon(
          iconData,
          color: Colors.black,
          size: 25.0,
        ),
      ),
    );
  }
}
