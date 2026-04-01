import 'package:ecommerse/features/cart/presentation/pages/cart_page.dart';
import 'package:ecommerse/features/favorites/persentation/pages/favorite_page.dart';
import 'package:ecommerse/features/home/presentation/pages/home_page.dart';
import 'package:ecommerse/features/menu/persentation/page/menu_page.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController _pageCtrl;

  int currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const CartPage(),
    const FavoritePage(),
    const MenuPage(),
  ];

  @override
  void initState() {
    super.initState();
    _pageCtrl = PageController();
  }

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageCtrl,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: _pages,
      ),
      backgroundColor: Colors.black,
      drawerScrimColor: Colors.amber,

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 20, spreadRadius: 0.01),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontSize: 16),
          unselectedLabelStyle: TextStyle(fontSize: 16),
          iconSize: 28,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
          ],
          currentIndex: currentIndex,
          onTap: (index) {
            _pageCtrl.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
        ),
      ),
    );
  }
}
