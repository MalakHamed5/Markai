import 'package:ecommerse/features/home/presentation/widget/brand_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/brand/brand_bloc.dart';

class HomeBrandSection extends StatelessWidget {
  const HomeBrandSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 120,
        child: BlocBuilder<BrandBloc, BrandState>(
          builder: (context, state) {
            return state.maybeWhen(
              initial: () => const SizedBox.shrink(),
              loading: () => const SizedBox.shrink(),
              success: (brands) => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: brands.length,
                itemBuilder: (context, i) =>
                    BrandCard(emoji: brands[i].emoji, name: brands[i].name),
              ),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
