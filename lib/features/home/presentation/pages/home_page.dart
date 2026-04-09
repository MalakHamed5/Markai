import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerse/core/shared/widgets/custom_search_bar.dart';
import 'package:ecommerse/dommy_data.dart';
import 'package:ecommerse/features/home/presentation/widget/category_card.dart';
import 'package:ecommerse/features/profile/presentation/profile/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helper/tools.dart';
import '../../../../core/routes/routes_name.dart';
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
  }

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
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.banners.length,
                  itemBuilder: (context, i) =>
                      _BanarCard(image: data.banners[i]),
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
                    context.go(RoutesName.productsPopular);
                  },
                ),
              ),
            ),

            // Popular Product List
            SliverToBoxAdapter(
              child: SizedBox(
                height: 260,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.products.length,
                  itemBuilder: (context, i) =>
                      CustomCard(model: data.products[i]),
                ),
              ),
            ),

            // Category Section Title
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _SectionTitle(
                  title: tr.category,
                  onPressed: () {
                    context.go(RoutesName.brands);
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
                  mainAxisExtent: 120, // تقريباً ارتفاع الكارد
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
                    context.go(RoutesName.bestForYou);
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
                  itemBuilder: (context, i) =>
                      CustomCard(model: data.products[i]),
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
                    context.go(RoutesName.buyAgain);
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
                  itemBuilder: (context, i) =>
                      _BanarCard(image: data.brands[i]),
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
                    context.go(RoutesName.buyAgain);
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
                  itemBuilder: (context, i) =>
                      CustomCard(model: data.products[i]),
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
          CircleAvatar(
            radius: 25,
            backgroundImage: CachedNetworkImageProvider(
              user?.image ??
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
