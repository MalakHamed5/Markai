import 'package:flutter/material.dart';

class BrandModel {
  final String image;
  BrandModel({required this.image});
}

class BrandCard extends StatelessWidget {
  const BrandCard({required this.model, super.key});

  final BrandModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(model.image, fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }
}
