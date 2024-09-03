import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../models/product_model.dart';
import '../../product_screen.dart';




class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              imageUrl: product.imageUrl,
              price: product.price,
              title: product.name,
              description: product.description,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with overlay icons
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    product.imageUrl,
                    height: 150.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8.0,
                  right: 8.0,
                  child: Row(
                    children: [
                      _buildIconOverlay(CupertinoIcons.bookmark, size: 20.0),
                      const SizedBox(width: 4.0),
                      _buildIconOverlay(CupertinoIcons.heart, size: 20.0),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            // Product title
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            // Feature icons displayed in two lines
            Wrap(
              spacing: 8.0, // Space between items
              runSpacing: 8.0, // Space between lines
              children: [
                _buildFeatureIcon(
                    CupertinoIcons.bed_double, '${product.bedrooms} bedroom'),
                _buildFeatureIcon(
                    CupertinoIcons.drop, '${product.bathrooms} Bathroom'),
                _buildFeatureIcon(CupertinoIcons.person_2,
                    '${product.masterRooms} Master room'),
                _buildFeatureIcon(CupertinoIcons.car_detailed,
                    '${product.parkingSpaces} Parking'),
              ],
            ),
            const SizedBox(height: 8.0),
            // Price and Add to Cart Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    product.price,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle Add to Cart
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2D3E5B),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                  ),
                  icon: const Icon(
                      CupertinoIcons.cart, size: 16.0, color: Colors.white),
                  label: const Text(
                      'Add to cart', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureIcon(IconData icon, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min, // Ensures the row doesn't take more space than needed
      children: [
        Icon(icon, size: 14.0, color: Colors.black),
        const SizedBox(width: 4.0),
        Text(
          label,
          style: const TextStyle(fontSize: 14.0, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildIconOverlay(IconData icon, {double size = 24.0}) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: size, color: Colors.black),
    );
  }
}
