import 'package:ecommerse/features/home/presentation/bloc/catagory/catagory_bloc.dart';
import 'package:ecommerse/features/home/presentation/widget/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/widgets/base_page_layout.dart';

class CatagoriesPage extends StatefulWidget {
  const CatagoriesPage({super.key});

  @override
  State<CatagoriesPage> createState() => _CatagoriesPageState();
}

class _CatagoriesPageState extends State<CatagoriesPage> {
  @override
  void initState() {
    super.initState();
    context.read<CatagoryBloc>().getCatagories();
  }

  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      title: 'Categories',
      detail: 'All Categories',
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<CatagoryBloc, CatagoryState>(
              builder: (context, state) {
                return state.maybeWhen(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  success: (catagories) => GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 150,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, i) => CategoryCard(
                      image: catagories[i].image,
                      title: catagories[i].name,
                    ),
                    itemCount: catagories.length,
                  ),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
