import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Hi Yousef !',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.notifications_none),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'What are you looking for ?',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.tune),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF3F80FF),
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
              const SizedBox(height: 20),
              _sectionTitle('Popular Product'),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Expanded(
                    child: ProductCard(
                      title: 'Smart Watch',
                      price: '499 LE',
                      image: 'https://images.unsplash.com/photo-1546868871-7041f2a55e12?q=80&w=600',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ProductCard(
                      title: 'iPhone 11 Pro',
                      price: '19999 LE',
                      image: 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=600',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _sectionTitle('Category'),
              const SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
                children: const [
                  CategoryCard('Pampers', 'https://images.unsplash.com/photo-1584515933487-779824d29309?q=80&w=600'),
                  CategoryCard('Electronics', 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=600'),
                  CategoryCard('Plants', 'https://images.unsplash.com/photo-1485955900006-10f4d324d411?q=80&w=600'),
                  CategoryCard('Phones', 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=600'),
                  CategoryCard('Food', 'https://images.unsplash.com/photo-1566478989037-eec170784d0b?q=80&w=600'),
                  CategoryCard('Fashion', 'https://images.unsplash.com/photo-1441986300917-64674bd600d8?q=80&w=600'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Text(
          'View all',
          style: TextStyle(color: Colors.blue),
        ),
      ],
    );
  }
}

Widget _brandChip(String title) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(title),
    );
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
          const SizedBox(height: 8),
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


// Add this promo banner section inside your HomePage Column where needed
Widget buildPromoBanner() {
  return Container(
    height: 180,
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: const DecorationImage(
        image: NetworkImage(
          'https://images.unsplash.com/photo-1529139574466-a303027c1d8b?q=80&w=1200&auto=format&fit=crop',
        ),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black54,
            Colors.transparent,
          ],
        ),
      ),
      padding: const EdgeInsets.all(16),
      alignment: Alignment.bottomLeft,
      child: const Text(
        'New Collection',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
