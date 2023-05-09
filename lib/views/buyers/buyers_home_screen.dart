import 'package:ecommerce_app/views/ui_additional_widgets.dart/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuyersHomeScreen extends StatefulWidget {
  const BuyersHomeScreen({super.key});

  @override
  State<BuyersHomeScreen> createState() => _BuyersHomeScreenState();
}

class _BuyersHomeScreenState extends State<BuyersHomeScreen> {
  @override

  // _pageIndex

  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: elementsColor,
        
        items: [
       BottomNavigationBarItem(
         icon: SvgPicture.asset('assets/icons/home.svg', width: 20,),
         label: 'Home', 
       ),
        BottomNavigationBarItem(
         icon: SvgPicture.asset('assets/icons/category.svg', width: 20,),
         label: 'Categories', 
       ),
        BottomNavigationBarItem(
         icon: SvgPicture.asset('assets/icons/store.svg', width: 20,),
         label: 'Explore',  
       ), 
       BottomNavigationBarItem(
        icon: SvgPicture.asset('assets/icons/cart.svg', width: 20,),
         label: 'Cart',  
       ),
       BottomNavigationBarItem(
        icon: SvgPicture.asset('assets/icons/search.svg', width: 20,),
         label: 'Search',  
       ),
        BottomNavigationBarItem(
        icon: SvgPicture.asset('assets/icons/account.svg', width: 20,),
         label: 'Account',  
       )
     
      ],),
    );
  }
}