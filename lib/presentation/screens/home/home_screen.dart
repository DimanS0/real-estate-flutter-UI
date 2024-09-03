import 'package:flutter/material.dart';
import 'package:mseti1/presentation/screens/home/home_widgets/product_tab.dart';
import 'category_segment/category_segment.dart';
import 'home_widgets/appbar_widget.dart';
import 'home_widgets/custom_bottom_navbar.dart';
import 'home_widgets/custom_tabview.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D3E5B),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            automaticallyImplyLeading: false, // Removes the back button
            expandedHeight: 210.0,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: CustomAppBar(),
            ),
            pinned: true,
            elevation: 0.0,
          ),
          SliverToBoxAdapter(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double borderRadius = 30.0;
                if (constraints.maxHeight < 200.0) {
                  borderRadius = 30.0 * (1 - (200.0 - constraints.maxHeight) / 200.0);
                }

                return ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(borderRadius),
                  ),
                  child: Container(
                    color: Colors.white,
                    height: 2000,
                    child: const Column(
                      children: [
                        CategorySegment(),
                        SizedBox(height: 16.0),
                        CustomTabView(),
                        SizedBox(height: 20,),
                        ProductTab(),
                  //      SizedBox(height: 20,),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(), // Add the custom bottom navigation bar
    );
  }
}
