import 'package:ecommerce_app/views/ui_additional_widgets.dart/colors.dart';
import 'package:flutter/material.dart';

showSnackbar(context, String title) {
  
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: basicColor,
    content: Text(title, style: TextStyle(fontWeight: FontWeight.bold),)));
}
