import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/base/appText.dart';
import '../../../../core/base/custom_app_button.dart';
import '../../../../core/base/custom_text_field.dart';
import '../../../../core/route/route.dart';
import '../../../../core/utils/app_colors.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final TextEditingController emailController = TextEditingController();

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
                      "Forgot Password",
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF0F172A),
                    ),
                    const SizedBox(height: 12),

                    // Description
                    AppText(
                      "Enter your email address to receive a verification code to reset your password.",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF64748B),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),

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
                    const SizedBox(height: 5),
                    CustomTextField(
                      textEditingController: emailController,
                      hintText: 'Enter your email address',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 14, bottom: 14, top: 14, right: 10),
                        child: SvgPicture.asset(
                          "assets/icons/emailIcon.svg",
                        ),
                      ),
                      hintStyle: const TextStyle(
                        fontFamily: 'SfPro-Regular',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                      fillColor: const Color(0xFFFFFFFF),
                    ),
                    const SizedBox(height: 32),

                    // Send Code Button
                    CustomAppButton(
                      text: "Send Code",
                      onTap: () {
                        Get.toNamed(AppRoutes.otpScreen, arguments: {'isForgotPassword': true});
                      }
                    ),
                    const SizedBox(height: 32),

                    // Back to Log In Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          "Remember password?",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF64748B),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            Get.back();
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
