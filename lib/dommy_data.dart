import 'package:ecommerse/core/constants/assets.dart';
import 'package:ecommerse/features/home/presentation/widget/brand_card.dart';
import 'package:ecommerse/features/home/presentation/widget/custom_card.dart';

import 'features/home/presentation/widget/category_card.dart';

class DommyData {
  List<ProductCard> products = [
    ProductCard(
      image: Assets.imagesAirpods,
      off: 25,
      name: 'Smart Watch Samsung a15',
      price: 400,
      rating: 4.5,
      onFavPressed: () {},
    ),
    ProductCard(
      image: Assets.imagesHeadPhone,
      off: 25,
      name: 'iPhone 11 Pro',
      price: 19999,
      rating: 4.9,
      onFavPressed: () {},
    ),
    ProductCard(
      image: Assets.imagesShoes,
      off: 25,
      name: 'Smart Watch 2',
      price: 500,
      rating: 4.6,
      onFavPressed: () {},
    ),
    ProductCard(
      image: Assets.imagesTv,
      off: 25,
      name: 'iPhone 12',
      price: 22000,
      rating: 4.8,
      onFavPressed: () {},
    ),
  ];

  List<BrandModel> brands = [
    BrandModel(image: Assets.imagesTownTeamLogo2),
    BrandModel(image: Assets.imagesJBLLogo),
    BrandModel(image: Assets.imagesAdidasLogo),
    BrandModel(image: Assets.imagesTownTeamLogo2),
    BrandModel(image: Assets.imagesAdidasLogo),
    BrandModel(image: Assets.imagesJBLLogo),
    BrandModel(image: Assets.imagesAdidasLogo),
    BrandModel(image: Assets.imagesTownTeamLogo2),
  ];

  List<String> banners = [
    Assets.imagesOffer1,
    Assets.imagesOffer1,
    Assets.imagesOffer1,
    Assets.imagesOffer1,
  ];

  List<CategoryModel> categories = [
    CategoryModel(
      title: 'Pampers',
      image: Assets.imagesPampers,
    ),
    CategoryModel(
      title: 'Electronics',
      image: Assets.imagesPampers,
    ),
    CategoryModel(
      title: 'Plants',
      image: Assets.imagesPlant,
    ),
    CategoryModel(
      title: 'Pampers',
      image: Assets.imagesPampers,
    ),
    CategoryModel(
      title: 'Electronics',
      image: Assets.imagesPampers,
    ),
    CategoryModel(
      title: 'Plants',
      image: Assets.imagesPlant,
    ),
  ];
}
