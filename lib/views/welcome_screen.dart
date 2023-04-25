import 'package:ecommerce_app/views/buyers/buyers_screen.dart';
import 'package:ecommerce_app/views/ui_additional_widgets.dart/animated_background.dart';
import 'package:ecommerce_app/views/ui_additional_widgets.dart/snake_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final hideNotifier = ValueNotifier(false);

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
                height: size.height * .75,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Text(
                        'Welcome!',
                        style: GoogleFonts.poppins(
                          fontSize: size.height * .040,
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                        ),
                      ),
                
                SizedBox( height: 10,),
                       
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'DROP',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                    
                      fontSize: 60,
                      color: Color.fromARGB(255, 73, 162, 213)),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your ecommerce platform',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                  
                      fontSize: 14,
                      color: Colors.white,
                ),
                )),
          SizedBox(height: 450),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: SnakeButton(
                              onPressed: () =>
                                  _openPage(context, const BuyersScreen()),
                              child: Text(
                                'DROP.BUYERS',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 132, 210, 255)
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: RectangularButton(
                              onPressed: () =>
                                  _openPage(context, const BuyersScreen()),
                              label: 'DROP.VENDORS',
                              
                            ),
                          ),
                        ],
                      )
                    
                  
                
                    ]),),
          )))]) );
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
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Color.fromARGB(255, 132, 210, 255)
          ),
        ),
      ),
    );
  }
}

 