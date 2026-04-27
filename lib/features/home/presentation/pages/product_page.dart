import 'dart:developer';

import 'package:ecommerse/features/home/presentation/bloc/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/product_model.dart';
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
    return Scaffold(
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          final List<ProductModel>? products = state.maybeWhen(
            success: (p) => p,
            failure: (m) => null,
            orElse: () => null,
          );
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              childAspectRatio: 0.8,
            ),
            itemCount: products!.length,
            itemBuilder: (context, i) {
              final product = products[i];

              // Product Card Widget
              return CustomCard(
                product: product,
                off: product.discountPercentage,
                name: product.title,
                price: product.price,
                rating: product.rating,
                image: product.thumbnail,
              );
            },
          );
        },
      ),
    );
  }
}
