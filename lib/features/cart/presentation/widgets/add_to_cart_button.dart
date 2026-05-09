
import 'package:ecommerse/features/cart/presentation/cart/cart_bloc.dart';
import 'package:ecommerse/features/home/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';

class AddToCartButton extends StatelessWidget {
  final ProductModel product;
  const AddToCartButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final cardWidth = constraints.maxWidth;
      return Center(
        child: SizedBox(
          width: cardWidth * 0.8,
          height: 40,
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              final isInCart = state.cartProducts.any((e) => e.id == product.id);
              return TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                    side: const BorderSide(color: AppColors.primary),
                  ),
                ),
                onPressed: () {
                  context.read<CartBloc>().add(
                        CartEvent.toggle(product: product),
                      );
                },
                child: Text(
                  isInCart ? "Remove" : "Add",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: isInCart ? Colors.black : AppColors.primary,
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}