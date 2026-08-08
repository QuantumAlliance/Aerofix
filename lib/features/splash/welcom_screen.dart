import 'package:aerofix/core/base/appText.dart';
import 'package:aerofix/core/base/custom_app_button.dart';
import 'package:aerofix/core/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            // House Image
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: size.height * 0.62,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                child: Image.asset(
                  'assets/images/houseImg.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // White Curved Bottom Section
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: size.height * 0.45,
              child: ClipPath(
                clipper: CurvedTopClipper(),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.04),

                      // Logo
                      SvgPicture.asset(
                        'assets/icons/houseIcon.svg',
                        width: 72,
                        height: 72,
                      ),
                      const SizedBox(height: 8),

                      // Welcome Text
                      AppText(
                        "WELCOME TO AEROFIX",
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF0F172A),
                      ),
                      const SizedBox(height: 8),

                      // Description
                      AppText(
                        "Reliable home services, whenever and\nwherever you need them.",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF64748B),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 14),

                      CustomAppButton(
                        text: "Get Started",
                      ),
                      const SizedBox(height: 10),

                      // Already have account
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: OutlinedButton(
                          onPressed: () {
                            Get.offAllNamed(AppRoutes.loginScreen);
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF182235),
                            side: const BorderSide(
                              color: Color(0xFFE2E8F0),
                            ),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'I already have an account',
                            style: TextStyle(
                              fontFamily: "SfPro-Regular",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF0F172A)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),

                      // Terms
                      Text(
                        'By continuing, you agree to our Terms of Service and Privacy Policy.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "SfPro-Regular",
                          fontSize: 12,
                          color: Color(0xFF64748B),
                        ),
                      ),
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

class CurvedTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 45);

    path.quadraticBezierTo(
      size.width * 0.25,
      5,
      size.width * 0.55,
      10,
    );

    path.quadraticBezierTo(
      size.width * 0.82,
      15,
      size.width,
      45,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}