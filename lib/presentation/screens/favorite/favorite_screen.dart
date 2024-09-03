import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/favorite_provider.dart';
import '../../widgets/custom_button.dart';
import '../home/home_widgets/custom_bottom_navbar.dart';


class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int _selectedToggleIndex = 0;
  int _selectedRadioIndex = -1; // For radio button selection

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Favorites', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF2D3E5B),
        automaticallyImplyLeading: true, // Enable the back button
        iconTheme: const IconThemeData(color: Colors.white), // Back button color
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.add),
            onPressed: () {
              // Implement add new item functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Toggle Buttons with Icons
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: ToggleButtons(
              borderRadius: BorderRadius.circular(7.0),
              fillColor: const Color(0xFF2D3E5B),
              selectedColor: Colors.white,
              color: Colors.black,
              isSelected: [
                _selectedToggleIndex == 0,
                _selectedToggleIndex == 1,
                _selectedToggleIndex == 2,
              ],
              onPressed: (index) {
                setState(() {
                  _selectedToggleIndex = index;
                  // Implement filter logic based on selected index
                });
              },
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 7.0), // Adjusted padding for spacing
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.house, size: 16.0),
                      SizedBox(width: 8.0),
                      Text("House"),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 7.0), // Adjusted padding for spacing
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.lightbulb, size: 16.0),
                      SizedBox(width: 8.0),
                      Text("Tips"),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 7.0), // Adjusted padding for spacing
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.building_2_fill, size: 16.0),
                      SizedBox(width: 8.0),
                      Text("Building"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // List of Favorites
          Expanded(
            child: ListView.builder(
              itemCount: favoritesProvider.favorites.length,
              itemBuilder: (context, index) {
                final article = favoritesProvider.favorites[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    elevation: 2.0,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(7.0),
                      leading: Radio<int>(
                        value: index,
                        groupValue: _selectedRadioIndex,
                        onChanged: (int? value) {
                          setState(() {
                            _selectedRadioIndex = value ?? -1;
                          });
                        },
                      ),
                      title: Row(
                        children: [
                          Image.asset(article.imageUrl, width: 60.0, height: 60.0, fit: BoxFit.cover),
                          const SizedBox(width: 7.0),
                          Expanded(
                            child: Text(article.title),
                          ),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          favoritesProvider.removeFavorite(article);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 7.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                        child: const Text(
                          'Remove',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Summary Section with Total and Add More Items Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement add more items functionality
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.grey[200],
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                  child: const Text('Add more items'),
                ),
                const Text('Total: Tzs 750,000.00', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          // Bottom Continue Button
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: CustomButton(
              text: 'Continue',
              onPressed: () {
                // Implement continue action
              },
              isLoading: false, // Set this to true if you need to show a loading spinner
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(), // Add the custom bottom navigation bar
    );
  }
}
