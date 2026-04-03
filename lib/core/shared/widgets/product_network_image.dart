import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductNetworkImage extends StatelessWidget {
  const ProductNetworkImage({
    super.key,
    required this.image,
    this.fit,
    this.isSquare = false,
  });

  final String image;
  final BoxFit? fit;
  final bool isSquare;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: isSquare ? 1.0 : 1.5,
      child: CachedNetworkImage(
        imageUrl: image,
        fit: fit ?? BoxFit.cover,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
