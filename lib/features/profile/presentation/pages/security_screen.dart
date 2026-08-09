import 'package:flutter/material.dart';
import '../../../../core/base/appText.dart';
import '../../../../core/base/custom_app_bar.dart';
import '../../../../core/base/custom_app_button.dart';
import '../../../../core/base/custom_text_field.dart';
import '../../../../core/utils/app_colors.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: "Security",
        isTransparent: true,
      ),
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    AppText(
                      "Change Password",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF0F172A),
                    ),
                    const SizedBox(height: 8),
                    AppText(
                      "Update your password to keep your account\nsecure.",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF64748B),
                    ),
                    const SizedBox(height: 24),
                    
                    CustomTextField(
                      hintText: "Current Password",
                      isPassword: true,
                      textEditingController: TextEditingController(),
                      fillColor: Colors.white,
                      hintStyle: const TextStyle(
                        fontFamily: 'SfPro-Regular',
                        fontSize: 14,
                        color: Color(0xFF94A3B8),
                      ),
                      inputTextStyle: const TextStyle(
                        fontFamily: 'SfPro-Regular',
                        fontSize: 14,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    CustomTextField(
                      hintText: "New Password",
                      isPassword: true,
                      textEditingController: TextEditingController(),
                      fillColor: Colors.white,
                      hintStyle: const TextStyle(
                        fontFamily: 'SfPro-Regular',
                        fontSize: 14,
                        color: Color(0xFF94A3B8),
                      ),
                      inputTextStyle: const TextStyle(
                        fontFamily: 'SfPro-Regular',
                        fontSize: 14,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    CustomTextField(
                      hintText: "Confirm New Password",
                      isPassword: true,
                      textEditingController: TextEditingController(),
                      fillColor: Colors.white,
                      hintStyle: const TextStyle(
                        fontFamily: 'SfPro-Regular',
                        fontSize: 14,
                        color: Color(0xFF94A3B8),
                      ),
                      inputTextStyle: const TextStyle(
                        fontFamily: 'SfPro-Regular',
                        fontSize: 14,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    CustomAppButton(
                      text: "Save Password",
                      onTap: () {},
                    ),
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
