import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/helper/tools.dart';

class RootShell extends StatelessWidget {
  final StatefulNavigationShell statefulNavigationShell;
  const RootShell({super.key, required this.statefulNavigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ----- body -----
      body: statefulNavigationShell,
      // ----- bottom nav -----
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
                color: context.theme.shadow,
                blurRadius: 20,
                spreadRadius: 0.01),
          ],
        ),
        child: BottomNavigationBar(
          
          // for navigation between pages
          currentIndex: statefulNavigationShell.currentIndex,
          onTap: (i) => statefulNavigationShell.goBranch(i),

          //style 
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontSize: 16),
          unselectedLabelStyle: const TextStyle(fontSize: 16),
          iconSize: 28,
          
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
