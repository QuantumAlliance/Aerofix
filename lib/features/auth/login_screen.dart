import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/base/appText.dart';
import '../../core/base/custom_app_button.dart';
import '../../core/base/custom_text_field.dart';
import '../../core/route/route.dart';
import '../../core/utils/app_colors.dart';
import 'sign_up_screen.dart';
class LoginScreen extends StatelessWidget{

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

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
            top: size.height * 0.13,
            bottom: 0,
            child: ClipPath(
              clipper: CurvedTopClipper(),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                  children: [
                    SizedBox(height: size.height * 0.04),

                    // Logo
                    SvgPicture.asset(
                      'assets/icons/mainIconBlack.svg',
                    ),
                    const SizedBox(height: 8),

                    // Welcome Text
                    AppText(
                      "WELCOME Back",
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0F172A),
                    ),
                    const SizedBox(height: 8),

                    // Description
                    AppText(
                      "Log in book services and manage your \naccount.",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF64748B),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 18),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        "Email Address",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    SizedBox(height: 5),

                    CustomTextField(
                      textEditingController: emailController,
                      hintText: 'Enter your email address',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 14, bottom: 14, top: 14, right: 10),
                        child: SvgPicture.asset(
                          "assets/icons/emailIcon.svg",
                        ),
                      ),
                      hintStyle: TextStyle(
                        fontFamily: 'SfPro-Regular',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                      fillColor: const Color(0xFFFFFFFF),
                    ),
                    SizedBox(height: 14),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        "Enter your Password",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    SizedBox(height: 5),

                    CustomTextField(
                      textEditingController: passwordController,
                      hintText: 'Password',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 14,top: 14, bottom: 14, right: 10),
                        child: SvgPicture.asset(
                          "assets/icons/passwordIcon.svg",
                        ),
                      ),
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                      isPassword: true,
                      fillColor: const Color(0xFFFFFFFF),
                    ),
                    SizedBox(height: 8),

                    Align(
                      alignment: Alignment.centerRight,
                      child: AppText(
                        "Forgot Password?",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF64748B),
                      ),
                    ),
                    SizedBox(height: 14),

                    CustomAppButton(
                      text: "Log In",
                    ),
                    const SizedBox(height: 16),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {

                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          surfaceTintColor: Colors.white,
                          foregroundColor: const Color(0xFF00B982),
                          elevation: 12,
                          shadowColor: Colors.black.withOpacity(0.4),
                          side: const BorderSide(
                            color: Color(0xFFE2E8F0),
                            width: 0.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Continue as Gust',
                          style: TextStyle(
                            fontFamily: 'SfPro-Regular',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.mainAppColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    
                    // OR divider
                    Row(
                      children: [
                        const Expanded(child: Divider(color: Color(0xFFE2E8F0), thickness: 1)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: AppText(
                            "or",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF0F172A),
                          ),
                        ),
                        const Expanded(child: Divider(color: Color(0xFFE2E8F0), thickness: 1)),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Google Login Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF1F5F9),
                          foregroundColor: const Color(0xFF0F172A),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/Social Icons.svg',
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              'Continue with Google',
                              style: TextStyle(
                                fontFamily: 'SfPro-Regular',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF0F172A),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Sign Up Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          "Don't have an account?",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF64748B),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.signUpScreen);
                          },
                          child: AppText(
                            "Sign Up",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.mainAppColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
                ),
              ),
            ),
          ),
        ],
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