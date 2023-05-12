import 'package:ecommerce_app/views/ui_additional_widgets.dart/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';

class SearchInputWidget extends StatelessWidget {
  const SearchInputWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TextField(
         decoration: InputDecoration(
           fillColor: basicColor,
           filled: true,
           hintText: 'Search for products', border: OutlineInputBorder(
           borderSide: BorderSide.none
         ),
         prefixIcon: Padding(
           padding: const EdgeInsets.all(14.0),
           child: SvgPicture.asset('assets/icons/search.svg', width: 6),
         )
         ),
         ),
      ),
    );
  }
}