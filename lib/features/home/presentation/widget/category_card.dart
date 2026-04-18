import 'package:flutter/material.dart';


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
      // height: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(model.image, fit: BoxFit.cover),
            ),

          ),
          Text(model.title, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
