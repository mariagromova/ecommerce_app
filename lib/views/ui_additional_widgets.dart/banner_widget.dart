import 'package:ecommerce_app/views/ui_additional_widgets.dart/colors.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          color: elementsColor,
          borderRadius: BorderRadius.circular(10)
        ),

        child: PageView(
          children: [
            Text('Banner 1'),
            Text('Banner 2'),
            Text('Banner 3'),
          ],
        ),
      ),
    );
  }
}