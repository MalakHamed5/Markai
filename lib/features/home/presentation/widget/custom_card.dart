import 'package:flutter/material.dart';

import '../../../../core/helper/tools.dart';
import '../../../../core/shared/widgets/product_network_image.dart';
import '../../../../core/theme/app_colors.dart';

//---------------------- CUSTOM CARD----------------------
class ProductCard extends StatelessWidget {
  final String image;
  final double off;
  final String name;
  final double price;
  final double rating;
  final bool isGrid;
  final VoidCallback onFavPressed;
  final Function()? onTap;
  const ProductCard(
      {super.key,
      required this.image,
      required this.off,
      required this.name,
      required this.price,
      required this.rating,
      this.isGrid = false,
      required this.onFavPressed,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: isGrid ? null : 200,
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product
            Stack(
              children: [
                // image
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: AspectRatio(
                    aspectRatio: 1.3,
                    child: ProductNetworkImage(
                      image: image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // off button
                // add it after backend
                //* _OffButton(widget: widget),
                // favourit button
                _FavouritButton(
                  onFavPressed: onFavPressed,
                ),
              ],
            ),

            // title and price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star_border, size: 18),
                          Text(
                            rating.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  vSpace(2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // name of product
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                        ),
                      ),

                      // add to cart button
                    ],
                  ),
                  vSpace(2),
                  const _AddButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final cardWidth = constraints.maxWidth;
      return Center(
        child: SizedBox(
          width: cardWidth * 0.8,
          height: 40,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
                side: const BorderSide(color: AppColors.primary),
              ),
            ),
            onPressed: () {},
            child: const Text(
              "Add",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      );
    });
  }
}

class _FavouritButton extends StatelessWidget {
  const _FavouritButton({
    required this.onFavPressed,
  });

  final VoidCallback onFavPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: IconButton(
          onPressed: onFavPressed,
          icon: const Icon(Icons.favorite_border),
        ),
      ),
    );
  }
}

// class _OffButton extends StatelessWidget {
//   const _OffButton({required this.widget});

//   final ProductCard widget;

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 8,
//       left: 8,
//       child: Container(
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(14),
//           color: AppColors.primary.withValues(alpha: 0.2),
//         ),
//         child: Text(
//           widget.model.off,
//           style: const TextStyle(color: AppColors.primary),
//         ),
//       ),
//     );
//   }
// }
