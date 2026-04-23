import 'package:ecommerse/core/shared/widgets/base_page_layout.dart';
import 'package:ecommerse/features/home/presentation/widget/custom_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      title: "Favorites",
      detail: "Al Products",
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: 20,
          itemBuilder: (context, i) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, i) {
                return const CustomCard(
                  off: 25,
                  image: Assets.imagesAirpods,
                  name: 'Smart Watch Samsung a15',
                  price: 1500,
                  rating: 4.5,
                );
              },
            );
          }),
    );
  }
}
