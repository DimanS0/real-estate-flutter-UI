import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CategorySegment extends StatelessWidget {
  const CategorySegment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCategoryButton(
            icon: CupertinoIcons.house_alt,
            label: 'House',
            isActive: false,
          ),
          _buildCategoryButton(
            icon: CupertinoIcons.lightbulb,
            label: 'Tips',
            isActive: true,
          ),
          _buildCategoryButton(
            icon: CupertinoIcons.building_2_fill,
            label: 'Building',
            isActive: false,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton({
    required IconData icon,
    required String label,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () {
        // Placeholder for tap functionality
        print('$label tapped');
      },
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          border: isActive ? Border.all(color: Colors.grey.shade300, width: 1) : null,
          boxShadow: isActive
              ? [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ]
              : [],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              // Placeholder for tap functionality
              print('$label tapped');
            },
            splashColor: Colors.black.withOpacity(0.2), // Black overlay on tap
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.black54, // Light black color
                  size: 30,
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.black54, // Light black color
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
