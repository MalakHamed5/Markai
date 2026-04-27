import 'package:ecommerse/core/helper/tools.dart';
import 'package:ecommerse/core/shared/widgets/base_page_layout.dart';
import 'package:ecommerse/features/home/data/model/product_model.dart';
import 'package:ecommerse/features/home/presentation/widget/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../favorite/favorite_bloc.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(const FavoriteEvent.getFavorites());
  }

  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      title: tr.favorites,
      detail: tr.allProducts,
      child: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          final products = state.favProducts;

          return SliverGrid.builder(
            itemCount: products.length,
            itemBuilder: (context, i) {
              final ProductModel p = products[i];
              return CustomCard(
                product: p,
                off: p.discountPercentage,
                image: p.images.first,
                name: p.title,
                price: p.price,
                rating: p.rating,
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
          );
        },
      ),
    );
  }
}
