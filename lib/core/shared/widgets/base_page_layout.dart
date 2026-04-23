import 'package:ecommerse/core/shared/bottons/custom_back_button.dart';
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
              SliverAppBar(
                automaticallyImplyLeading: false,
                floating: true,
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
                expandedHeight: isSearch ? 180 : 80,
                centerTitle: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomBackButton(),

                      /// search
                      const CustomSearchBar(),

                      /// detail
                      Text(
                        detail,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(child: child),
            ],
          ),
        ),
      ),

      /// المحتوى
    );
  }
}
