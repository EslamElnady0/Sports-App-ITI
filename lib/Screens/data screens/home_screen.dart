import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sports_app/constants/constants.dart';

import '../../Shared/widgets/category_grid_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Sports Categories',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: AnimationLimiter(
        child: GridView.count(
            padding: const EdgeInsets.all(10),
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1,
            children: sportCategories.asMap().entries.map((e) {
              int index = e.key;

              return AnimationConfiguration.staggeredGrid(
                position: index,
                columnCount: 2,
                duration: const Duration(milliseconds: 1500),
                child: FadeInAnimation(
                  curve: Curves.easeIn,
                  child: SlideAnimation(
                    curve: Curves.easeIn,
                    horizontalOffset: MediaQuery.of(context).size.width,
                    verticalOffset: MediaQuery.of(context).size.height,
                    duration: const Duration(milliseconds: 700),
                    child: GridItem(
                        text: sportCategories[index]["text"]!,
                        image: sportCategories[index]["image"]!),
                  ),
                ),
              );
            }).toList()),
      ),
    );
  }
}
