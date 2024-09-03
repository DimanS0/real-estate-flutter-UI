import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../widgets/custom_button.dart'; // Import your CustomButton widget
import '../home/home_widgets/custom_bottom_navbar.dart'; // Import your CustomBottomNavigationBar widget

class ProductDetailScreen extends StatelessWidget {
  final String imageUrl;
  final String price;
  final String title;
  final String description;

  const ProductDetailScreen({
    required this.imageUrl,
    required this.price,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Container(
              width: double.infinity,
              height: 250.0, // Adjust as needed
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Price and Basic Description
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            // Icon Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIconInfo(context, FontAwesomeIcons.bed, '8 bedroom'),
                  _buildIconInfo(context, FontAwesomeIcons.bath, '4 Bathroom'),
                  _buildIconInfo(context, FontAwesomeIcons.doorClosed, '4 Master room'),
                  _buildIconInfo(context, FontAwesomeIcons.car, '8 Parking'),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            // Small Rectangle Image Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                height: 150.0, // Adjust as needed
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: const DecorationImage(
                    image: AssetImage('images/background/back.jpg'), // Replace with your image path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            // Text Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Mpango wa Jengo: Unda mpango wa kina wa jengo lako...',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            // Button with Cart Icon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    text: 'Add to Shopping Cart',
                    onPressed: () {
                      // Handle Add to Cart
                    },
                    // icon: FontAwesomeIcons.shoppingCart,
                  ),
                  IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.heart,
                      color: Colors.grey, // Make the heart icon grey
                      size: 20.0, // Minimized size
                    ),
                    onPressed: () {
                      // Handle favorite action
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(), // Add the custom bottom navigation bar
    );
  }

  Widget _buildIconInfo(BuildContext context, IconData icon, String label) {
    return Column(
      children: [
        FaIcon(icon, color: Colors.grey, size: 18.0), // Grey color and minimized size
        const SizedBox(height: 4.0),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.grey, // Make the label text grey as well
          ),
        ),
      ],
    );
  }
}
