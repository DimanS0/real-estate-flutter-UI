import 'package:flutter/material.dart';
import 'package:mseti1/presentation/screens/home/home_widgets/recommended_tab_widget.dart';
import '../models/article.dart';



class RecommendedTab extends StatelessWidget {
  const RecommendedTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Article> articles = [
      Article(
        imageUrl: 'images/background/back.jpg',
        articleNumber: '04',
        title: 'VITU 8 VYA KUZINGATIA\nKabala ya Kuanza ujenzi wa Nyumba ya Ghorofa',
        description: [
          'Kabla ya kuanza ujenzi wa nyumba ya ghorofa, ni muhimu kufanya utafiti wa kina juu ya eneo unalotaka kujenga...',
        ],
      ),
      Article(
        imageUrl: 'images/background/back4.jpg',
        articleNumber: '05',
        title: 'JINSI YA KUJENGA\nNyumba Imara kwa Bajeti Nafuu',
        description: [
          'Kujiandaa vizuri kwa mradi wa ujenzi ni hatua ya kwanza katika kujenga nyumba imara kwa bajeti nafuu...',
        ],
      ),
      Article(
        imageUrl: 'images/background/back6.jpg',
        articleNumber: '06',
        title: 'MAWAZO YA KISASA\nKatika Ujenzi wa Makazi ya Kifahari',
        description: [
          'Katika ujenzi wa makazi ya kifahari, ni muhimu kutumia mbinu za kisasa ambazo zinazingatia ubora na ufanisi...',
        ],
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Horizontal Cards (Recommended Section)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: articles.map((article) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: RecommendedCard(article: article),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 50.0),  // Space between Recommended Cards and any other content
        ],
      ),
    );
  }
}
