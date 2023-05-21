import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/views/ui_additional_widgets.dart/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ui_additional_widgets.dart/border_clipper.dart';

class VendorsSignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final resizeNotifier = ValueNotifier<bool>(false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // +
      if (!resizeNotifier.value) resizeNotifier.value = true;
    });

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! > 3) {
            resizeNotifier.value = false;
            Navigator.pop(context); //+
          }
        },
        child: Stack(
          children: <Widget>[
            ValueListenableBuilder<bool>(
              valueListenable: resizeNotifier,
              builder: (_, value, child) {
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
                //+
                height: size.height,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: size.height * .1),
                    const Spacer(),
                    Stack(
                      children: [
                        const Center(child: _DragDownIndication()),
                        Padding(
                          padding: const EdgeInsets.only(top: 105),
                          child: ClipPath(
                            clipper: InvertedTopBorderClipper(
                              circularRadius: 40,
                            ),
                            child: Container(
                              height: 450,
                              width: double.infinity,
                              color: basicColor,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: _FormInputsColumn(),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FormInputsColumn extends StatelessWidget {

  final AuthController _authController = AuthController();

  late String email;
  late String fullName;
  late String phoneNumber;
  late String password;

  _signUpUser() async {
    String res = await _authController.signUpUsers(
        email, fullName, phoneNumber, password);

    if (res != "success") {
      print(res);
    } else {
      print('Good');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Email',
                icon: Icon(Icons.alternate_email, color: elementsColor)),
            onChanged: (value) {
              email = value;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Full name',
                icon: Icon(FontAwesome.user, color: elementsColor)),
            onChanged: (value) {
              fullName = value;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Phone number',
                icon: Icon(FontAwesome.phone, color: elementsColor)),
            onChanged: (value) {
              fullName = value;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Password',
                icon: Icon(Icons.lock_outline, color: elementsColor)),
            onChanged: (value) {
              fullName = value;
            },
          ),
          SizedBox(height: 10),
          SizedBox(
            width: size.width * .65,
            child: TextButton(
              onPressed: () {
                _signUpUser();
              },
              style: TextButton.styleFrom(
                foregroundColor: basicColor,
                padding: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: elementsColor,
              ),
              child: const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _DragDownIndication extends StatelessWidget {
  const _DragDownIndication();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700, fontSize: 40, color: logoColor),
          'Sign in',
        ),
        Text(
          'Swipe to go back',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            height: 2,
            fontSize: 18,
            color: basicColor,
          ),
        ),
        Icon(
          Icons.keyboard_arrow_down,
          color: basicColor,
          size: 35,
        ),
      ],
    );
  }
}
