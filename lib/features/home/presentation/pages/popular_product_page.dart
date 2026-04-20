import 'package:ecommerse/features/home/presentation/bloc/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/widgets/base_page_layout.dart';
import '../widget/custom_card.dart';

class PopularProductPage extends StatelessWidget {
  const PopularProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      title: 'Popular Product',
      detail: 'All Products',
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                return state.maybeWhen(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  success: (products) => GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, i) {
                        return ProductCard(
                          off: products[i].discountPercentage,
                          name: products[i].title,
                          price: products[i].price,
                          rating: products[i].rating,
                          image: products[i].thumbnail,
                          onFavPressed: () {},
                        );
                      }),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
