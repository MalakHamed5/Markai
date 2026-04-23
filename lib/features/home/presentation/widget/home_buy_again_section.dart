import 'package:ecommerse/features/home/presentation/widget/custom_card.dart';
import 'package:ecommerse/features/profile/presentation/profile/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/assets.dart';

class HomeBuyAgainSection extends StatelessWidget {
  const HomeBuyAgainSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: state.maybeWhen(
            guest: () => const SizedBox.shrink(),
            orElse: () => SizedBox(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, i) {
                  return const CustomCard(
                    off: 25,
                    image: Assets.imagesAirpods,
                    name: 'Smart Watch Samsung a15',
                    price: 400,
                    rating: 4.5,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
