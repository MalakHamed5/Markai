import 'dart:developer';

import 'package:ecommerse/features/favorites/presentation/favorite/favorite_bloc.dart';
import 'package:ecommerse/features/home/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritButton extends StatelessWidget {
  final ProductModel product;
  const FavouritButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            final isFav =
                state.favProducts.any((e) => e.id == product.id);
            log('isFavor$isFav');
            log('STATE LIST: ${state.favProducts.map((e) => e.id)}');
            log('CURRENT ID: $product');
            return IconButton(
              onPressed: () {
                log('you in here in UI');
                context.read<FavoriteBloc>().add(
                      FavoriteEvent.toggleFavorite(product: product),
                    );
              },
              icon: isFav
                  ? const Icon(Icons.favorite, color: Colors.black)
                  : const Icon(Icons.favorite_outline, color: Colors.black),
            );
          },
        ),
      ),
    );
  }
}
