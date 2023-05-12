import 'package:ecommerce_app/views/buyers/nav_screens/account_screen.dart';
import 'package:ecommerce_app/views/buyers/nav_screens/cart_screen.dart';
import 'package:ecommerce_app/views/buyers/nav_screens/category_screen.dart';
import 'package:ecommerce_app/views/buyers/nav_screens/home_screen.dart';
import 'package:ecommerce_app/views/buyers/nav_screens/search_screen.dart';
import 'package:ecommerce_app/views/buyers/nav_screens/store_screen.dart';
import 'package:ecommerce_app/views/ui_additional_widgets.dart/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuyersMainScreen extends StatefulWidget {
  const BuyersMainScreen({super.key});

  @override
  State<BuyersMainScreen> createState() => _BuyersHomeScreenState();
}

class _BuyersHomeScreenState extends State<BuyersMainScreen> {
  @override

  int _pageIndex = 0;

  List <Widget> _pages = [
    BuyersHomeScreen(),
    AccountScreen(),
    CartScreen(),
    CategoryScreen(),
    SearchScreen(),
    StoreScreen()
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _pageIndex,
        onTap: (value) { // NEED TO REFACTOR
          setState(() {
            _pageIndex = value;
          });
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: elementsColor,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              width: 20,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/category.svg',
              width: 20,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/store.svg',
              width: 20,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/cart.svg',
              width: 20,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              width: 20,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/account.svg',
              width: 20,
            ),
            label: 'Account',
          )
        ],
      ),

      body: _pages[_pageIndex],
    );
  }
}
