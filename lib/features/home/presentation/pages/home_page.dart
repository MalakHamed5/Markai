

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helper/tools.dart';
import '../../../../core/routes/routes_name.dart';
import '../../../../core/shared/widgets/custom_search_bar.dart';
import '../../../../core/shared/widgets/product_network_image.dart';
import '../../../../core/theme/app_colors.dart';
import '../widget/category_card.dart';
import '../widget/custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [
    CategoryModel(
      title: 'Pampers',
      image:
          'https://images.unsplash.com/photo-1584515933487-779824d29309?q=80&w=600',
    ),
    CategoryModel(
      title: 'Electronics',
      image:
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=600',
    ),
    CategoryModel(
      title: 'Plants',
      image:
          'https://images.unsplash.com/photo-1485955900006-10f4d324d411?q=80&w=600',
    ),
  ];

  List<CustomCardModel> products = [
    CustomCardModel(
      image:
          'https://images.unsplash.com/photo-1546868871-7041f2a55e12?q=80&w=600',
      off: '25% off',
      name: 'Smart Watch',
      price: '400 LE',
      rating: '4.5',
    ),
    CustomCardModel(
      image:
          'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=600',
      off: '25% off',
      name: 'iPhone 11 Pro',
      price: '19999 LE',
      rating: '4.9',
    ),
    CustomCardModel(
      image:
          'https://images.unsplash.com/photo-1546868871-7041f2a55e12?q=80&w=600',
      off: '25% off',
      name: 'Smart Watch 2',
      price: '500 LE',
      rating: '4.6',
    ),
    CustomCardModel(
      image:
          'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=600',
      off: '25% off',
      name: 'iPhone 12',
      price: '22000 LE',
      rating: '4.8',
    ),
  ];

  List<String> brands = [
    'https://images.unsplash.com/photo-1584515933487-779824d29309?q=80&w=600',
    'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=600',
    'https://images.unsplash.com/photo-1485955900006-10f4d324d411?q=80&w=600',
    'https://images.unsplash.com/photo-1584515933487-779824d29309?q=80&w=600',
    'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=600',
    'https://images.unsplash.com/photo-1485955900006-10f4d324d411?q=80&w=600',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ----- Header
              const _HeaderWidget(),

              // ----- Search Bar
              const CustomSearchBar(),

              // ----- Banner
              const _BannerWidget(),

              // ----- Popular Product
              _SectionTitle(
                title: 'Popular Product',
                onPressed: () {
                  context.go(RoutesName.productsPopular);
                },
              ),

              // ----- Product Card
              SizedBox(
                height: 280,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, i) {
                    return CustomCard(model: products[i]);
                  },
                ),
              ),

              // ----- Category
              _SectionTitle(
                title: 'Category',
                onPressed: () {
                  context.go(RoutesName.brands);
                },
              ),

              // ----- Category Card
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                itemBuilder: (context, i) {
                  return CategoryCard(model: categories[i]);
                },
              ),

              // ----- Best for you
              _SectionTitle(
                title: "Best for you",
                onPressed: () {
                  context.go(RoutesName.bestForYou);
                },
              ),

              // Best for you card
              SizedBox(
                height: 280,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, i) {
                    return CustomCard(model: products[i]);
                  },
                ),
              ),

              // buy agian
              _SectionTitle(
                title: "Brands",
                onPressed: () {
                  context.go(RoutesName.buyAgain);
                },
              ),
              // Brands Card
              SizedBox(
                height: 120,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: brands.length,
                  itemBuilder: (context, i) {
                    return BrandContainer(image: brands[i]);
                  },
                ),
              ),

              // buy agian
              _SectionTitle(
                title: "Buy agian",
                onPressed: () {
                  context.go(RoutesName.buyAgain);
                },
              ),
              // buy agian card
              SizedBox(
                height: 280,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, i) {
                    return CustomCard(model: products[i]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BrandContainer extends StatelessWidget {
  const BrandContainer({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // user image
        CircleAvatar(
          radius: 25,
          backgroundImage: CachedNetworkImageProvider(
            'https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?q=80&w=1200&auto=format&fit=crop',
          ),
        ),

        hSpace(6),

        // user name
        const Expanded(
          child: Text(
            textAlign: TextAlign.start,
            // user
            'Hi Yousef!',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
          icon: const Icon(
            Icons.notifications_outlined,
            size: 30,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}

class _BannerWidget extends StatelessWidget {
  const _BannerWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(
          imageUrl:
              'https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?q=80&w=1200&auto=format&fit=crop',
          fit: BoxFit.cover,
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
            child: const Text(
              'View all',
              style: TextStyle(color: AppColors.primary, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
