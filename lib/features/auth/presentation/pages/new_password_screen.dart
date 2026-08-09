import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/base/appText.dart';
import '../../../../core/base/custom_app_button.dart';
import '../../../../core/base/custom_text_field.dart';
import '../../../../core/route/route.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({super.key});

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
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFCCFBF1),
                    Color(0x00CCFBF1),
                  ],
                ),
              ),
              child: Transform.scale(
                scale: 1.2,
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/dotedTopImg.png',
                  fit: BoxFit.fitWidth,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(),
                ),
              ),
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
                      "Create New Password",
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF0F172A),
                    ),
                    const SizedBox(height: 12),

                    // Description
                    AppText(
                      "Your new password must be different from previous used passwords.",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF64748B),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),

                    // Password
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        "New Password",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                      textEditingController: passwordController,
                      hintText: 'Enter your new password',
                      isPassword: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 14, top: 14, bottom: 14, right: 10),
                        child: SvgPicture.asset(
                          "assets/icons/passwordIcon.svg",
                        ),
                      ),
                      hintStyle: const TextStyle(
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                      fillColor: const Color(0xFFFFFFFF),
                    ),
                    const SizedBox(height: 14),

                    // Confirm Password
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        "Confirm Password",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                      textEditingController: confirmPasswordController,
                      hintText: 'Confirm your new password',
                      isPassword: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 14, top: 14, bottom: 14, right: 10),
                        child: SvgPicture.asset(
                          "assets/icons/passwordIcon.svg",
                        ),
                      ),
                      hintStyle: const TextStyle(
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                      fillColor: const Color(0xFFFFFFFF),
                    ),
                    const SizedBox(height: 32),

                    // Save Password Button
                    CustomAppButton(
                      text: "Save Password",
                      onTap: () {
                        // After saving password, navigate to login or home
                        Get.offAllNamed(AppRoutes.loginScreen);
                      }
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
