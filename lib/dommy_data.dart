import 'package:ecommerse/features/home/presentation/widget/custom_card.dart';

import 'features/home/presentation/widget/category_card.dart';

class DommyData {
   List<CustomCardModel> products = [
    CustomCardModel(
      image:
          'https://images.unsplash.com/photo-1546868871-7041f2a55e12?q=80&w=600',
      off: '25% off',
      name: 'Smart Watch Samsung a15',
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

  List<String> banners = [
    'https://images.unsplash.com/photo-1584515933487-779824d29309?q=80&w=600',
    'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=600',
    'https://images.unsplash.com/photo-1485955900006-10f4d324d411?q=80&w=600',
    'https://images.unsplash.com/photo-1584515933487-779824d29309?q=80&w=600',
    'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=600',
    'https://images.unsplash.com/photo-1485955900006-10f4d324d411?q=80&w=600',
  ];

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

}