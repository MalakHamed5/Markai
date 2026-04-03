import 'package:flutter/material.dart';

import '../../../../core/shared/widgets/custom_page.dart';
import '../widget/custom_card.dart';

class PopularProductPage extends StatelessWidget {
  const PopularProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<CustomCardModel> products = [
      CustomCardModel(
        off: '25% off',
        name: 'Smart Watch',
        price: '499 LE',
        rating: '4.5',
        image:
            'https://images.unsplash.com/photo-1546868871-7041f2a55e12?q=80&w=600',
      ),

      CustomCardModel(
        off: '25% off',
        name: 'iPhone 11 Pro',
        price: '19999 LE',
        rating: '4.9',
        image:
            'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=600',
      ),
    ];
    return CustomPage(
      title: 'Popular Product',
      detail: 'All Products',
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: products.length,
            itemBuilder: (context, i) {
              return CustomCard(model: products[i]);
            },
          ),
        ],
      ),
    );
  }
}
