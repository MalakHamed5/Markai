import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerse/core/shared/widgets/custom_search_bar.dart';
import 'package:ecommerse/features/profile/presentation/profile/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/helper/tools.dart';
import '../bloc/brand/brand_bloc.dart';
import '../bloc/catagory/catagory_bloc.dart';
import '../bloc/product/product_bloc.dart';
import '../widget/home_brand_section.dart';
import '../widget/home_buy_again_section.dart';
import '../widget/home_category_section.dart';
import '../widget/home_header.dart';
import '../widget/home_product_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<CatagoryBloc>().getCatagories();
    context.read<ProductCubit>().getProducts();
    context.read<BrandBloc>().getBrands();

    context.read<ProfileBloc>().add(const ProfileEvent.getUserData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            const HomeHeader(),

            // Search Bar
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: CustomSearchBar(),
              ),
            ),

            // Banner
            SliverToBoxAdapter(
              child: CarouselSlider.builder(
                itemCount: 5,
                itemBuilder: (context, i, _) =>
                    const _BanarCard(image: Assets.imagesOffer1),
                options: CarouselOptions(
                  // height: 140,
                  enlargeCenterPage: true,
                  autoPlayCurve: Curves.easeInOut,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                  aspectRatio: 18 / 7,
                ),
              ),
            ),

            // Product Section Title
            _SectionTitle(
              title: tr.popularProduct,
              onPressed: () => context.pushNamed('popularProduct'),
            ),

            const HomeProductSection(),

            // Category Section Title
            _SectionTitle(
              title: tr.category,
              onPressed: () {
                context.goNamed('catagories');
              },
            ),

            // Category Grid
            const HomeCategorySection(),

            // Brands Section
            _SectionTitle(
              title: tr.brands,
              onPressed: () {
                context.pushNamed('brands');
              },
            ),

            // Brands List
            const HomeBrandSection(),

            //  Buy Again Section
            _SectionTitle(
              title: tr.buyAgain,
              onPressed: () {
                context.pushNamed('buyAgain');
              },
            ),

            // Buy Again List
            const HomeBuyAgainSection(),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, this.onPressed});

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            TextButton(
              onPressed: onPressed,
              child: Text(
                tr.viewAll,
                style: TextStyle(color: context.theme.primary, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BanarCard extends StatelessWidget {
  const _BanarCard({required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(image, fit: BoxFit.scaleDown),
    );
  }
}
