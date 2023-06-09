import 'package:ecommerce_app/views/ui_additional_widgets.dart/animated_background.dart';
import 'package:ecommerce_app/views/ui_additional_widgets.dart/colors.dart';
import 'package:ecommerce_app/views/ui_additional_widgets.dart/snake_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'buyers_login_screen.dart';
import 'buyers_sign_in.dart';

class BuyersScreen extends StatelessWidget {
  BuyersScreen({super.key});

  final hideNotifier = ValueNotifier(false);
  
  final resizeNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        
        resizeToAvoidBottomInset: false,
        body: Stack(
          fit: StackFit.expand,
           children: <Widget>[
          const AnimatedBackground(),
          ValueListenableBuilder<bool>(
              valueListenable: hideNotifier,
              builder: (context, value, child) {
                return AnimatedPositioned(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.fastOutSlowIn,
                  top: 0,
                  bottom: value ? -100 : 0,
                  left: 0,
                  right: 0,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.fastOutSlowIn,
                    opacity: value ? 0.0 : 1.0,
                    child: child,
                  ),
                );
              },
              child: Center(
                  child: SizedBox(
                height: size.height,

                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 60),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                           padding: EdgeInsets.fromLTRB(0, 0, 300, 0),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios_new),
                            color: elementsColor,
                            iconSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                   
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'DROP.Buyers',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 40,
                                color: logoColor),
                          ),
                        ),
                        const SizedBox(height: 500),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: SnakeButton(
                                onPressed: () =>
                                    _openPage(context, BuyersLoginScreen()),
                                child: Text(
                                  'LOGIN',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 14,
                                      color:logoColor),
                                ),
                              ),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: RectangularButton(
                                onPressed: () =>
                                    _openPage(context, BuyersSignIn()),
                                label: 'SIGN IN',
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              )))
        ]));
  }

  Future<void> _openPage(BuildContext context, Widget page) async {
    hideNotifier.value = true;
    await Navigator.push(
      context,
      PageRouteBuilder<dynamic>(
        opaque: false,
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(opacity: animation, child: page);
        },
      ),
    );
    hideNotifier.value = false;
  }
}

class RectangularButton extends StatelessWidget {
  const RectangularButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .056,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: basicColor,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w900,
              fontSize: 14,
              color: logoColor),
        ),
      ),
    );
  }
}
