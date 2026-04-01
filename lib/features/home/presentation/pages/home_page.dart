import 'package:ecommerse/core/helper/tools.dart';
import 'package:ecommerse/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ----- Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?q=80&w=1200&auto=format&fit=crop',
                    ),
                  ),
                  Text(
                    'Hi Yousef !',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.notifications_outlined,
                    size: 30,
                    color: AppColors.primary,
                  ),
                ],
              ),
              vSpace(16),

              // ----- Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'What are you looking for ?',
                  prefixIcon: const Icon(Icons.search_outlined),
                  suffixIcon: const Icon(Icons.tune_outlined),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                ),
              ),
              vSpace(16),
              // ----- Banner
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?q=80&w=1200&auto=format&fit=crop',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              vSpace(16),

              // ----- Popular Product
              SectionTitle(title: 'Popular Product'),
              vSpace(10),

              // ----- Product Card
              Row(
                children: [
                  Expanded(
                    child: ProductCard(
                      title: 'Smart Watch',
                      price: '499 LE',
                      image:
                          'https://images.unsplash.com/photo-1546868871-7041f2a55e12?q=80&w=600',
                    ),
                  ),
                  hSpace(12),
                  Expanded(
                    child: ProductCard(
                      title: 'iPhone 11 Pro',
                      price: '19999 LE',
                      image:
                          'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=600',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SectionTitle(title: 'Category'),
              const SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
                children: const [
                  CategoryCard(
                    'Pampers',
                    'https://images.unsplash.com/photo-1584515933487-779824d29309?q=80&w=600',
                  ),
                  CategoryCard(
                    'Electronics',
                    'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=600',
                  ),
                  CategoryCard(
                    'Plants',
                    'https://images.unsplash.com/photo-1485955900006-10f4d324d411?q=80&w=600',
                  ),
                  CategoryCard(
                    'Phones',
                    'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=600',
                  ),
                  CategoryCard(
                    'Food',
                    'https://images.unsplash.com/photo-1566478989037-eec170784d0b?q=80&w=600',
                  ),
                  CategoryCard(
                    'Fashion',
                    'https://images.unsplash.com/photo-1441986300917-64674bd600d8?q=80&w=600',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title, this.onPressed});

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text('View all', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 90,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),

              child: Image.network(image, fit: BoxFit.cover),
            ),
          ),
          vSpace(8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          Text(price, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String image;

  const CategoryCard(this.title, this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(image, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 6),
          Text(title, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
