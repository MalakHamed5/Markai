import 'package:ecommerse/core/helper/tools.dart';
import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.shopping_cart_outlined,
        size: 20,
        color: context.theme.primary,
      ),
    );
  }
}
