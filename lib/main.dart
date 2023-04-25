import 'package:flutter/material.dart';
import 'views/welcome_screen.dart';


void main() {
  runApp(const EcommerceApp());
}


class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: WelcomeScreen(),
      
    );
  }
}
