
import 'package:flutter/material.dart';

class BuyersScreen extends StatefulWidget {
  const BuyersScreen({super.key});

  @override
  State<BuyersScreen> createState() => _BuyersScreen();
}

class _BuyersScreen extends State<BuyersScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'DROP Buyers'
        ),
      ),
    );
  }
}