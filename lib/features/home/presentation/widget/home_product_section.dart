import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product/product_bloc.dart';
import 'custom_card.dart';

class HomeProductSection extends StatelessWidget {
  const HomeProductSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: state.maybeWhen(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (products) {
                final visibleProducts = products.take(8).toList();
                return SizedBox(
                  height: 260,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: visibleProducts.length,
                    itemBuilder: (context, i) {
                      final product = visibleProducts[i];

                      return CustomCard(
                        product: product,
                        image: product.thumbnail,
                        name: product.title,
                        price: product.price,
                        rating: product.rating,
                        off: product.discountPercentage,
                        navigate: () {},
                        
                      );
                    },
                  ),
                );
              },
              orElse: () => const SizedBox.shrink()),
        );
      },
    );
  }
}
