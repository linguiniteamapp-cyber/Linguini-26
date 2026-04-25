import 'package:flutter/material.dart';
import 'home_page.dart';
import 'custom_bottom_bar.dart';
import 'package:linguini_app/search_chef.dart';
import 'package:linguini_app/basket.dart';
import 'package:linguini_app/order.dart';
import 'package:linguini_app/favoritechefs.dart';


class HomeRootPage extends StatefulWidget {
  const HomeRootPage({super.key});

  @override
  State<HomeRootPage> createState() => _HomeRootPageState();
}

class _HomeRootPageState extends State<HomeRootPage> {
  int currentIndex = 2;
  final PageController pageController = PageController(initialPage: 2);

  void changePage(int index) {
    setState(() => currentIndex = index);
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),

      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() => currentIndex = index);
        },
        children: [
          ActiveOrdersScreen(),
          const CartPage(),
          const HomePage(), // الصفحة اللي فيها الكروت
          // Center(child: Text("Chef")),
          const SearchPage(),
          FavoriteChefsScreen(),
        ],
      ),

      bottomNavigationBar: CustomBottomBar(
        currentIndex: currentIndex,
        onTap: changePage,
      ),
    );
  }
}
