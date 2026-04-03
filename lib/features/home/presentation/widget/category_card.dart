
import 'package:flutter/material.dart';

import '../../../../core/helper/tools.dart';
import '../../../../core/shared/widgets/product_network_image.dart';


class CategoryModel {
  final String title;
  final String image;

  CategoryModel({required this.title, required this.image});
}


class CategoryCard extends StatelessWidget {
  final CategoryModel model;

  const CategoryCard({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Container(
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
                child: ProductNetworkImage(isSquare: true,image: model.image), 
                // child: Image.network(image, fit: BoxFit.cover),
              ),
            ),
            hSpace(6),
            Text(model.title, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
