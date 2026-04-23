import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({required this.emoji, required this.name, super.key});

  final String emoji;
  final String name;

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
            child: Center(
                child: Text(emoji, style: const TextStyle(fontSize: 35))),
          ),
        ),
        Text(name),
      ],
    );
  }
}
