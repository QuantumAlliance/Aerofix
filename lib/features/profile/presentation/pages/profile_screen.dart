import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/base/appText.dart';
import '../../../../core/base/custom_app_button.dart';
import '../../../../core/route/route.dart';
import '../../../../core/utils/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                ),
              ),
            ),
          ),

          // Content
          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    // Title
                    AppText(
                      "Profile",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF0F172A),
                    ),
                    const SizedBox(height: 24),

                    // Profile Card
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        // White Card
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          padding: const EdgeInsets.only(top: 60, bottom: 20, left: 24, right: 24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFE2E8F0)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.02),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              _buildProfileInfoRow("Name:", "Alex Carter"),
                              const SizedBox(height: 12),
                              _buildProfileInfoRow("Email:", "alexcarter@gmail.com"),
                              const SizedBox(height: 12),
                              _buildProfileInfoRow("Phone number:", "+1 234 567 890"),
                            ],
                          ),
                        ),
                        // Avatar
                        Positioned(
                          top: 0,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFE2E8F0),
                              image: const DecorationImage(
                                image: NetworkImage("https://i.pravatar.cc/300?img=5"), // Placeholder
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                )
                              ]
                            ),
                          ),
                        ),
                        // Edit Icon
                        Positioned(
                          top: 60,
                          right: 16,
                          child: GestureDetector(
                            onTap: () {
                              // Edit action
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: const Icon(
                                Icons.edit_outlined,
                                color: AppColors.mainAppColor,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Menu List
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                      ),
                      child: Column(
                        children: [
                          _buildMenuItem(
                            "My information", 
                            "assets/icons/myInfoIcon.svg", 
                            onTap: () => Get.toNamed(AppRoutes.personalInfoScreen),
                          ),
                          const Divider(height: 1, color: Color(0xFFE2E8F0)),
                          _buildMenuItem(
                            "Address details", 
                            "assets/icons/addressDetailsIcon.svg",
                            onTap: () => Get.toNamed(AppRoutes.addressDetailsScreen),
                          ),
                          const Divider(height: 1, color: Color(0xFFE2E8F0)),
                          _buildMenuItem(
                            "Notification settings", 
                            "assets/icons/notificationSettingIcon.svg",
                            onTap: () => Get.toNamed(AppRoutes.notificationsScreen),
                          ),
                          const Divider(height: 1, color: Color(0xFFE2E8F0)),
                          _buildMenuItem(
                            "Payment details", 
                            "assets/icons/paymentDetailsIcon.svg", 
                            onTap: () => Get.toNamed(AppRoutes.paymentDetailsScreen),
                          ),
                          const Divider(height: 1, color: Color(0xFFE2E8F0)),
                          _buildMenuItem(
                            "Security", 
                            "assets/icons/securityIcon.svg", 
                            onTap: () => Get.toNamed(AppRoutes.securityScreen),
                          ),
                          const Divider(height: 1, color: Color(0xFFE2E8F0)),
                          _buildMenuItem(
                            "Help & Support", 
                            "assets/icons/help&supportIcon.svg", 
                            onTap: () => Get.toNamed(AppRoutes.helpSupportScreen),
                          ),
                          const Divider(height: 1, color: Color(0xFFE2E8F0)),
                          _buildMenuItem(
                            "Privacy Policy", 
                            "assets/icons/privacyPolicyIcon.svg", 
                            onTap: () => Get.toNamed(AppRoutes.privacyPolicyScreen),
                          ),
                          const Divider(height: 1, color: Color(0xFFE2E8F0)),
                          _buildMenuItem(
                            "Terms of Service", 
                            "assets/icons/privacyPolicyIcon.svg", // Using same icon as placeholder
                            onTap: () => Get.toNamed(AppRoutes.termsOfServiceScreen),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Log Out Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Log out action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEF4444), // Red color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              "Log Out",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 8),
                            SvgPicture.asset(
                              'assets/icons/logout.svg',
                              width: 20,
                              height: 20,
                              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                            ),
                          ],
                        ),
                      ),
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

  Widget _buildProfileInfoRow(String label, String value) {
    return Row(
      children: [
        SizedBox(
          width: 120,
          child: AppText(
            label,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF0F172A),
          ),
        ),
        Expanded(
          child: AppText(
            value,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF0F172A),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(String title, String iconPath, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AppText(
                title,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF0F172A),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF94A3B8)),
          ],
        ),
      ),
    );
  }
}
