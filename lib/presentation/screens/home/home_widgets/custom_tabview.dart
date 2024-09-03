import 'package:flutter/material.dart';
import 'recommended_tab.dart';

class CustomTabView extends StatefulWidget {
  const CustomTabView({super.key});

  @override
  _CustomTabViewState createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Custom TabBar
        TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.blueAccent),
          ),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: "Recommended"),
            Tab(text: "Most Viewed"),
            Tab(text: "News and Tips"),
          ],
        ),
        // TabBarView with different content for each tab
        SizedBox(
          height: 200.0, // Adjust height as needed
          child: TabBarView(
            controller: _tabController,
            children: [
              // Replace the placeholder with RecommendedTab
              const RecommendedTab(),  // Replace with the actual content
              _buildPlaceholderContent('Most Viewed Content'), // Placeholder
              _buildPlaceholderContent('News and Tips Content'), // Placeholder
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceholderContent(String text) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 18.0, color: Colors.black54),
      ),
    );
  }
}
