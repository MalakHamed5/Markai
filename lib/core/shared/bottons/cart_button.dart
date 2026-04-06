import 'package:ecommerse/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.shopping_cart_outlined,
        size: 20,
        color: AppColors.primary,
      ),
    );
  }
}
