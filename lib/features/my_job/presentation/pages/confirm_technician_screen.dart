import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/base/appText.dart';
import '../../../../core/base/custom_app_bar.dart';
import '../../../../core/utils/app_colors.dart';

class ConfirmTechnicianScreen extends StatelessWidget {
  const ConfirmTechnicianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: "Confirm Technician",
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
          
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        _buildProfileCard(),
                        const SizedBox(height: 16),
                        _buildInfoCard(
                          icon: Icons.design_services_outlined,
                          title: "Service Requested",
                          subtitle: "Electrician • Outlet & Switch Repair",
                          subtitleColor: AppColors.mainAppColor,
                          description: "Kitchen outlet is not working",
                        ),
                        const SizedBox(height: 16),
                        _buildInfoCard(
                          icon: Icons.calendar_today_outlined,
                          title: "Schedule",
                          subtitle: "Tue 21, 2026 (Aft)",
                        ),
                        const SizedBox(height: 16),
                        _buildInfoCard(
                          icon: Icons.location_on_outlined,
                          title: "Service Address",
                          subtitle: "123 Lorem Lane Unit 4B, Apt 123\nSampletown",
                        ),
                        const SizedBox(height: 16),
                        _buildPricingCard(),
                        const SizedBox(height: 16),
                        _buildPaymentMethodCard(),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
                
                // Bottom Fixed Bar
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainAppColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
                          const SizedBox(width: 8),
                          AppText(
                            "Confirm Technician",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  "https://i.pravatar.cc/150?img=11",
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: -8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: Color(0xFFF59E0B), size: 10),
                      const SizedBox(width: 2),
                      AppText(
                        "4.5",
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF0F172A),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  "Liam Carter",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF0F172A),
                ),
                const SizedBox(height: 2),
                AppText(
                  "Electrician",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF334155),
                ),
                const SizedBox(height: 2),
                AppText(
                  "8 Years of experience",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF64748B),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
    Color? subtitleColor,
    String? description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFE6F4EA), // Very light green
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColors.mainAppColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF0F172A),
                ),
                const SizedBox(height: 4),
                if (description != null) ...[
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontFamily: 'SfPro-Regular',
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: subtitle.split('•')[0] + '• ',
                          style: TextStyle(color: subtitleColor ?? const Color(0xFF334155), fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text: subtitle.split('•')[1],
                          style: const TextStyle(color: Color(0xFF334155)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  AppText(
                    description,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF64748B),
                  ),
                ] else ...[
                  AppText(
                    subtitle,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: subtitleColor ?? const Color(0xFF334155),
                  ),
                ],
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Color(0xFF94A3B8)),
        ],
      ),
    );
  }

  Widget _buildPricingCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            "Pricing",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF0F172A),
          ),
          const SizedBox(height: 16),
          _buildPricingRow("Estimated labour", "\$120"),
          const SizedBox(height: 12),
          _buildPricingRow("Service fee", "\$18"),
          const SizedBox(height: 12),
          _buildPricingRow("Tax (HST 13%)", "\$18"),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(height: 1, color: Color(0xFFE2E8F0)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                "Estimated total",
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF0F172A),
              ),
              AppText(
                "\$155",
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.mainAppColor,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFE6F4EA), // Very light green
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.info_outline, color: AppColors.mainAppColor, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: AppText(
                    "Final invoice may change if extra work is approved",
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF334155),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPricingRow(String title, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          title,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF334155),
        ),
        AppText(
          amount,
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF0F172A),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFE6F4EA),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.credit_card_outlined, color: AppColors.mainAppColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  "Payment Method", // Fixed typo from design
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF0F172A),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 16,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Center(
                        // Simple custom mastercard logo
                        child: SizedBox(
                          width: 16,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                child: Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFFEB001B), shape: BoxShape.circle)),
                              ),
                              Positioned(
                                right: 0,
                                child: Container(width: 10, height: 10, decoration: BoxDecoration(color: const Color(0xFFF79E1B).withOpacity(0.8), shape: BoxShape.circle)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    AppText(
                      "**** 4242",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF334155),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Color(0xFF94A3B8)),
        ],
      ),
    );
  }
}
