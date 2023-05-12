import 'package:ecommerce_app/views/ui_additional_widgets.dart/banner_widget.dart';
import 'package:ecommerce_app/views/ui_additional_widgets.dart/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../ui_additional_widgets.dart/search_input_widget.dart';
import '../../ui_additional_widgets.dart/welcome_text.dart';



class BuyersHomeScreen extends StatelessWidget {
  const BuyersHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top, left: 25, right: 15),
        child: const Column(
          children: [
           Padding(
             padding: EdgeInsets.all(8.0),
             child: WelcomeText(),
           ),
           SizedBox(height: 14),
            SearchInputWidget(),
            BannerWidget()
          ],
        ),

       
      ),
    );
  }
}



