import 'package:flutter/material.dart';

import '../models/product_model.dart';
import 'cards/product_card.dart';


class ProductTab extends StatelessWidget {
  const ProductTab({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product1 = Product(
      id: '1',
      name: 'Jengo la Compay',
      price: 'TZS 1,000,000',
      imageUrl: 'images/background/back3.jpeg',
      description: 'A beautiful luxury villa with modern amenities.',
      bedrooms: 8,
      bathrooms: 4,
      masterRooms: 4,
      parkingSpaces: 8,
    );

    final Product product2 = Product(
      id: '2',
      name: 'Nyumba ya Mjini',
      price: 'TZS 2,500,000',
      imageUrl: 'images/background/back.jpg',
      description: 'A modern city house with urban facilities.',
      bedrooms: 6,
      bathrooms: 3,
      masterRooms: 3,
      parkingSpaces: 2,
    );

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: [
            ProductCard(product: product1),
            const SizedBox(height: 16.0),
            ProductCard(product: product2),
            // Add more ProductCard widgets here if needed
          ],
        ),
      ),
    );
  }
}
