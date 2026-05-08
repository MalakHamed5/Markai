import 'dart:developer';

import 'package:ecommerse/core/helper/functions.dart';
import 'package:ecommerse/core/helper/tools.dart';
import 'package:ecommerse/features/cart/presentation/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/widgets/base_page_layout.dart';
import '../../../home/presentation/widget/custom_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(const CartEvent.getCart());
  }

  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      title: tr.cart,
      detail: tr.allProducts,
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
        return state.maybeWhen(
            success: (products) {
              return SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: 0.8,
                ),
                itemCount: products.length,
                itemBuilder: (context, i) {
                  final p = products[i];
                  log('in Cart page'); 

                  // Product Card Widget
                  return CustomCard(
                    product: p,
                    off: p.discountPercentage,
                    name: p.title,
                    price: p.price,
                    rating: p.rating,
                    image: p.thumbnail,
                  );
                },
              );
            },
            error: (m) {
              showNotifyMsg(text: m, context: context);
              return const SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    "No Products",
                    style:  TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
            orElse: () => const SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      "No Products",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ));
      }),
    );
  }
}
