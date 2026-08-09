import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/base/appText.dart';
import '../../../../core/base/custom_app_button.dart';
import '../../../../core/route/route.dart';
import '../../../../core/utils/app_colors.dart';

class OtpScreen extends StatelessWidget {

  final TextEditingController pinController = TextEditingController();

  OtpScreen({super.key});

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
                scale: 1.8,
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/dotedTopImg.png',
                  fit: BoxFit.fitWidth,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(),
                ),
              ),
            ),
          ),
          
          // Content
          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
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
                      "Verify Your Account",
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF0F172A),
                    ),
                    const SizedBox(height: 16),

                    // Email Illustration Image
                    Image.asset(
                      'assets/images/emailImg.png',
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 32),

                    // Instruction Text
                    AppText(
                      "Enter the 6-digit code we sent to",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF0F172A),
                    ),
                    const SizedBox(height: 8),
                    AppText(
                      "example@gmail.com",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.mainAppColor,
                    ),
                    const SizedBox(height: 24),

                    // OTP Field
                    PinCodeTextField(
                      appContext: context,
                      length: 6,
                      enableActiveFill: true,
                      showCursor: true,
                      cursorColor: AppColors.mainAppColor,
                      obscureText: false,
                      textStyle: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainAppColor,
                      ),
                      controller: pinController,
                      animationType: AnimationType.scale,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(8),
                        borderWidth: 0.5,
                        fieldHeight: 45.h,
                        fieldWidth: 45.w,
                        fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 4),
                        inactiveColor: const Color(0xFFE2E8F0),
                        inactiveFillColor: Colors.white,
                        selectedFillColor: Colors.white,
                        disabledColor: Colors.white,
                        activeFillColor: Colors.white,
                        selectedColor: AppColors.mainAppColor,
                        activeColor: AppColors.mainAppColor,
                      ),
                      hintCharacter: '-',
                      animationDuration: const Duration(milliseconds: 100),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      onChanged: (value) {},
                      onCompleted: (value) {
                        print("Entered Code: $value");
                      },
                    ),
                    const SizedBox(height: 4),

                    // Resend Timer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/timerIcon.svg',
                          height: 18,
                          width: 18,
                          colorFilter: const ColorFilter.mode(AppColors.mainAppColor, BlendMode.srcIn),
                        ),
                        const SizedBox(width: 8),
                        AppText(
                          "Resend code in ",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF0F172A),
                        ),
                        AppText(
                          "00:45",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.mainAppColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Verify/Create Account Button
                    CustomAppButton(
                      text: (Get.arguments != null && Get.arguments['isForgotPassword'] == true) 
                          ? "Verify" 
                          : "Create Account",
                      onTap: () {
                        if (Get.arguments != null && Get.arguments['isForgotPassword'] == true) {
                          Get.toNamed(AppRoutes.newPasswordScreen);
                        } else {
                          Get.toNamed(AppRoutes.setUpProfileScreen);
                        }
                      },
                    ),
                    const SizedBox(height: 32),

                    // Resend Code Bottom Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          "Don't receive the code?",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF64748B),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            // Resend logic
                          },
                          child: AppText(
                            "Resend Code",
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
