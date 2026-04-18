import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerse/core/shared/widgets/custom_search_bar.dart';
import 'package:ecommerse/dommy_data.dart';
import 'package:ecommerse/features/home/presentation/home/home_bloc.dart';
import 'package:ecommerse/features/home/presentation/widget/brand_card.dart';
import 'package:ecommerse/features/home/presentation/widget/category_card.dart';
import 'package:ecommerse/features/profile/presentation/profile/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/assets.dart' show Assets;
import '../../../../core/helper/tools.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/shared/widgets/product_network_image.dart';
import '../widget/custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(const ProfileEvent.getUserData());
    context.read<HomeBloc>().getProducts();
  }

  // fake
  final DommyData data = DommyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: _HeaderWidget(),
              ),
            ),

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
                itemCount: data.banners.length,
                itemBuilder: (context, i, _) =>
                    _BanarCard(image: data.banners[i]),
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.easeInOut,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
            ),

            // Popular Product Section Title
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _SectionTitle(
                  title: tr.popularProduct,
                  onPressed: () {
                    context.go(AppPath.productPopular);
                  },
                ),
              ),
            ),

            // Popular Product List
            SliverToBoxAdapter(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  log('Home Page');
                  log(state.toString());
                  return state.when(
                    initial: () => const SizedBox.shrink(
                      child: Text('initial'),
                    ),
                    loading: () => const SizedBox.shrink(
                      child: Text('loading'),
                    ),
                    success: (products) => SizedBox(
                      height: 260,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: products.length,
                        itemBuilder: (context, i) {
                          final product = products[i];
                          return ProductCard(
                            image: product.thumbnail,
                            name: product.title,
                            price: product.price,
                            rating: product.rating,
                            onFavPressed: () {},
                            off: product.discountPercentage,
                          );
                        },
                      ),
                    ),
                    failure: (error) => const SizedBox.shrink(
                      child: Text('failure'),
                    ),
                  );
                },
              ),
            ),

            // Category Section Title
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _SectionTitle(
                  title: tr.category,
                  onPressed: () {
                    context.go(AppPath.brands);
                  },
                ),
              ),
            ),

            // Category Grid
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => CategoryCard(model: data.categories[i]),
                  childCount: data.categories.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 150,
                  childAspectRatio: 0.75,
                ),
              ),
            ),

            // Best for you Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _SectionTitle(
                  title: tr.bestForYou,
                  onPressed: () {
                    context.go(AppPath.bestForYou);
                  },
                ),
              ),
            ),

            // Best for you List
            SliverToBoxAdapter(
              child: SizedBox(
                height: 280,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.products.length,
                  itemBuilder: (context, i) {
                    return ProductCard(
                      image: '',
                      name: 'Smart Watch Samsung a15',
                      price: 400,
                      rating: 4.5,
                      onFavPressed: () {},
                      off: 25,
                    );
                  },
                ),
              ),
            ),

            // Brands Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _SectionTitle(
                  title: tr.brands,
                  onPressed: () {
                    context.go(AppPath.buyAgain);
                  },
                ),
              ),
            ),

            // Brands List
            SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.brands.length,
                  itemBuilder: (context, i) => BrandCard(model: data.brands[i]),
                ),
              ),
            ),

            // Buy Again Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _SectionTitle(
                  title: tr.buyAgain,
                  onPressed: () {
                    context.go(AppPath.buyAgain);
                  },
                ),
              ),
            ),

            // Buy Again List
            SliverToBoxAdapter(
              child: SizedBox(
                height: 280,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.products.length,
                  itemBuilder: (context, i) {
                    return ProductCard(
                      off: 25,
                      image: Assets.imagesAirpods,
                      name: 'Smart Watch Samsung a15',
                      price: 400,
                      rating: 4.5,
                      onFavPressed: () {},
                    );
                  },
                ),
              ),
            ),
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
    return Padding(
      padding: const EdgeInsets.only(top: 12),
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
              style: TextStyle(color: theme.primary, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class _BanarCard extends StatelessWidget {
  const _BanarCard({required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.outline),
      ),
      padding: const EdgeInsets.all(12),
      child: ProductNetworkImage(
        image: image,
        fit: BoxFit.cover,
        isSquare: true,
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      final user = state.maybeWhen(
        success: (_, u) => u,
        orElse: () => null,
      );
      final isGuest = (user == null);

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // user image
          const CircleAvatar(
            radius: 25,
            backgroundImage: CachedNetworkImageProvider(
              'https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?q=80&w=1200&auto=format&fit=crop',
            ),
          ),
          hSpace(6),
          // user name
          Expanded(
            child: Text(
              textAlign: TextAlign.start,
              // user
              '${tr.hi} ${isGuest ? tr.there : user.name}!',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              softWrap: false,
              overflow: TextOverflow.fade,
            ),
          ),

          const Spacer(),
          // notification button
          IconButton(
            onPressed: () {
              // ToDo: context.go(RoutesName.notification);
            },
            icon: Icon(
              Icons.notifications_outlined,
              size: 30,
              color: theme.primary,
            ),
          ),
        ],
      );
    });
  }
}
