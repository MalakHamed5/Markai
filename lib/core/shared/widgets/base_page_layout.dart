import 'package:ecommerse/core/shared/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';

class BasePageLayout extends StatelessWidget {
  const BasePageLayout({
    super.key,
    required this.title,
    required this.detail,
    required this.child,
    this.isSearch = true,
  });

  final String title;
  final String detail;
  final Widget child;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              // -- App Bar --
              SliverAppBar(
                automaticallyImplyLeading: false,
                floating: true,
                centerTitle: true,
                title: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: const [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=300',
                    ),
                  ),
                ],
                snap: true,
              ),

              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isSearch ? const CustomSearchBar() : const SizedBox(),
                    Text(
                      detail,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              // -- Content --
              /// Have to be Sliver Type 
              child,
            ],
          ),
        ),
      ),
    );
  }
}
