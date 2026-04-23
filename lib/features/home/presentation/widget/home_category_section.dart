

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerse/features/home/presentation/bloc/catagory/catagory_bloc.dart';
import 'package:ecommerse/features/home/presentation/widget/category_card.dart';

class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<CatagoryBloc, CatagoryState>(
          builder: (context, state) {
            return state.maybeWhen(
              initial: () => const SizedBox.shrink(),
              loading: () => const SizedBox.shrink(),
              success: (catagories) {
                final visibleCatagory = catagories.take(6).toList();
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 150,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, i) => CategoryCard(
                    image: visibleCatagory[i].image,
                    title: visibleCatagory[i].name,
                  ),
                  itemCount: visibleCatagory.length,
                );
              },
              failure: (error) => const SizedBox.shrink(),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}