import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/base/appText.dart';
import '../../core/base/custom_app_button.dart';
import '../../core/base/custom_text_field.dart';
import '../../core/route/route.dart';
import '../../core/utils/app_colors.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image (Top)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: size.height * 0.35,
            child: Image.asset(
              'assets/images/splashImg.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const SizedBox(),
            ),
          ),
          
          // Form Content
          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.04),

                    // Logo
                    SvgPicture.asset(
                      'assets/icons/mainIconBlack.svg',
                    ),
                    const SizedBox(height: 10),

                    // Title
                    AppText(
                      "Create Account",
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF0F172A),
                    ),
                    const SizedBox(height: 12),

                    // Description
                    AppText(
                      "Let's get started! Please fill in the details below to create your account.",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF64748B),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),

                    // First Name
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        "First Name",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    SizedBox(height: 5),
                    CustomTextField(
                      textEditingController: firstNameController,
                      hintText: 'Enter your first name',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 14, bottom: 14, top: 14, right: 10),
                        child: SvgPicture.asset(
                          "assets/icons/personIcon.svg",
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

                    // Last Name
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        "Last Name",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    SizedBox(height: 5),
                    CustomTextField(
                      textEditingController: lastNameController,
                      hintText: 'Enter your last name',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 14, bottom: 14, top: 14, right: 10),
                        child: SvgPicture.asset(
                          "assets/icons/personIcon.svg",
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

                    // Email Address
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        "Email Address",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF0F172A),
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

                    // Phone Number
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        "Phone Number",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    SizedBox(height: 5),
                    CustomTextField(
                      textEditingController: phoneController,
                      hintText: 'Enter phone number',
                      keyboardType: TextInputType.phone,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 14, bottom: 14, top: 14, right: 10),
                        child: SvgPicture.asset(
                          "assets/icons/phoneIcon.svg",
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

                    // Password
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        "Password",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    SizedBox(height: 5),
                    CustomTextField(
                      textEditingController: passwordController,
                      hintText: 'Enter your password',
                      isPassword: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 14, top: 14, bottom: 14, right: 10),
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
                      fillColor: const Color(0xFFFFFFFF),
                    ),
                    SizedBox(height: 14),

                    // Confirm Password
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        "Password",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    SizedBox(height: 5),
                    CustomTextField(
                      textEditingController: confirmPasswordController,
                      hintText: 'Confirm your password',
                      isPassword: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 14, top: 14, bottom: 14, right: 10),
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
                      fillColor: const Color(0xFFFFFFFF),
                    ),
                    SizedBox(height: 24),

                    // Create Account Button
                    CustomAppButton(
                      text: "Create Account",
                      onTap: (){
                        Get.toNamed(AppRoutes.otpScreen);
                      }
                    ),
                    const SizedBox(height: 24),
                    
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
                    const SizedBox(height: 24),

                    // Google Login Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Google Sign Up
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF1F5F9),
                          foregroundColor: const Color(0xFF0F172A),
                          elevation: 0,
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
                    const SizedBox(height: 24),

                    // Log In Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          "Already have an account?",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF64748B),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: AppText(
                            "Log In",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.mainAppColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
