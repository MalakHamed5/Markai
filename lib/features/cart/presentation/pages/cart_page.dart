import 'package:ecommerse/core/constants/assets.dart';
import 'package:ecommerse/core/helper/tools.dart';
import 'package:ecommerse/core/shared/bottons/primary_button.dart';
import 'package:ecommerse/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Image
            Center(
              child: Image.asset(
                Assets.imagesCartEmpty2x,
                height: 300,
                width: 300,
              ),
            ),

            vSpace(8),

            // Text
            const Text("Your Cart is Empty", style: TextStyle(fontSize: 24)),

            // details
            const Expanded(
              child: Text(
                "Check our big offers, fresh products and fill your cart with items",
              ),
            ),

            vSpace(16),

            // button 
            PrimaryButton(
              child: const Text(
                "Start Shopping",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
              onPressed: () {
                // context.go(RouteNames.home);
              },
            ),
          ],
        ),
      ),
    );
  }
}
