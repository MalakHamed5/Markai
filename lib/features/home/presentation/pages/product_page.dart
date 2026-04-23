import 'package:ecommerse/features/home/presentation/bloc/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/widgets/base_page_layout.dart';
import '../widget/custom_card.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();

    context.read<ProductCubit>().getProducts();
  }

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
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
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
                        final product = products[i];
                        return CustomCard(
                          off: product.discountPercentage,
                          name: product.title,
                          price: product.price,
                          rating: product.rating,
                          image: product.thumbnail,
                          favId: product.id,
                          isFav: true,
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
