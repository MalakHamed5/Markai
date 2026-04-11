import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/helper/tools.dart';

class RootShell extends StatelessWidget {
  final StatefulNavigationShell statefulNavigationShell;
  const RootShell({super.key, required this.statefulNavigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: statefulNavigationShell,
      // ----- bottom nav -----
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(color: theme.shadow, blurRadius: 20, spreadRadius: 0.01),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontSize: 16),
          unselectedLabelStyle: const TextStyle(fontSize: 16),
          iconSize: 28,
          currentIndex: statefulNavigationShell.currentIndex,
          onTap: (index) => statefulNavigationShell.goBranch(index),
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home), label: tr.home),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              label: tr.cart,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              label: tr.favorite,
            ),
            BottomNavigationBarItem(
                icon: const Icon(Icons.menu), label: tr.menu),
          ],
        ),
      ),
    );
  }
}
