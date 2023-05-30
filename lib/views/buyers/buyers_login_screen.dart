import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/utils/show_snackbar.dart';
import 'package:ecommerce_app/views/buyers/buyers_main_screen.dart';
import 'package:ecommerce_app/views/ui_additional_widgets.dart/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ui_additional_widgets.dart/border_clipper.dart';
import '../ui_additional_widgets.dart/text_input.dart';

class BuyersLoginScreen extends StatefulWidget {
  @override
  State<BuyersLoginScreen> createState() => _BuyersLoginScreenState();
}

class _BuyersLoginScreenState extends State<BuyersLoginScreen> {
  late String email;
  late String password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();

  void _openHomePage(BuildContext context) {
    final newRoute = PageRouteBuilder<dynamic>(
      transitionDuration: const Duration(milliseconds: 1000),
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: const BuyersMainScreen(),
        );
      },
    );
    Navigator.pushAndRemoveUntil(context, newRoute, ModalRoute.withName(''));
  }

  _loginUsers() async {
    if (_formKey.currentState!.validate()) {
      await _authController.loginUsers(email, password);
      return showSnackbar(context, 'You are now logged in');
    } else {
      return showSnackbar(context, 'Fields must not be empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final resizeNotifier = ValueNotifier<bool>(false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!resizeNotifier.value) resizeNotifier.value = true;
    });

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! > 3) {
            resizeNotifier.value = false;
            Navigator.pop(context);
          }
        },
        child: Stack(
          children: <Widget>[
            ValueListenableBuilder<bool>(
              valueListenable: resizeNotifier,
              builder: (context, value, child) {
                return AnimatedPositioned(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.fastOutSlowIn,
                  bottom: value ? 0 : -size.height * .5,
                  left: 0,
                  right: 0,
                  child: child!,
                );
              },
              child: SizedBox(
                height: size.height,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      const Spacer(
                        flex: 1,
                      ),
                      Stack(
                        children: [
                          const Align(
                            alignment: Alignment.topCenter,
                            child: _DragDownIndication(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 105),
                            child: ClipPath(
                              clipper: InvertedTopBorderClipper(
                                circularRadius: 40,
                              ),
                              child: Container(
                                height: 360,
                                width: double.infinity,
                                color: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const SizedBox(height: 60),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          labelText: 'Email',
                                          icon: Icon(Icons.alternate_email,
                                              color: elementsColor)),
                                      onChanged: ((value) {
                                        email = value;
                                      }),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Email fields must not be empty';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          labelText: 'Password',
                                          icon: Icon(Icons.lock_outline,
                                              color: elementsColor)),
                                      onChanged: (value) {
                                        password = value;
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Password must not be empty';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Did you forget your password?',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: elementsColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: size.width * .65,
                                      child: TextButton(
                                        onPressed: () {
                                          _loginUsers();
                                          //  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                          //  const BuyersMainScreen()));
                                        },
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.all(12),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          backgroundColor: elementsColor,
                                        ),
                                        child: const Text(
                                          'Log in',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DragDownIndication extends StatelessWidget {
  const _DragDownIndication();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text(
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700, fontSize: 40, color: logoColor),
        'Log in',
      ),
      Text(
        'Swipe to go back',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          height: 2,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 30)
    ]);
  }
}
