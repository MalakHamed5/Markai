import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../bloc/product_details/product_details_bloc.dart';

class ProductDetailsPage extends StatefulWidget {
  final int id;
  const ProductDetailsPage({super.key, required this.id});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late final ProductDetailsCubit productDetailsCubit;
  @override
  void initState() {
    super.initState();
    productDetailsCubit = sl<ProductDetailsCubit>();
    productDetailsCubit.getSinglprodcut(widget.id);
  }

  @override
  void dispose() {
    productDetailsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: productDetailsCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Product Details'),
          centerTitle: true,
        ),
        body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              failure: (message) => Center(child: Text(message)),
              success: (product) => SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // IMAGE SECTION
                    Container(
                      height: 300,
                      width: double.infinity,
                      color: Colors.grey[200],
                      child: Image.network(
                        product.thumbnail,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // NAME + PRICE
                          Text(
                            product.title,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Row(
                            children: [
                              Text(
                                '\$${product.price}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '\$${product.price}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          // RATING
                          const Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange, size: 20),
                              Icon(Icons.star, color: Colors.orange, size: 20),
                              Icon(Icons.star, color: Colors.orange, size: 20),
                              Icon(Icons.star_half,
                                  color: Colors.orange, size: 20),
                              Icon(Icons.star_border,
                                  color: Colors.orange, size: 20),
                              SizedBox(width: 8),
                              Text('4.5'),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // DESCRIPTION
                          const Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            product.description,
                            style: TextStyle(
                              color: Colors.grey[700],
                              height: 1.4,
                            ),
                          ),

                          const SizedBox(height: 30),

                          // ADD TO CART BUTTON
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                // TODO: add to cart logic
                              },
                              child: const Text('Add to Cart'),
                            ),
                          ),

                          const SizedBox(height: 12),

                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: OutlinedButton(
                              onPressed: () {},
                              child: const Text('Buy Now'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
