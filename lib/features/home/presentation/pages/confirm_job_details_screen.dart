import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/base/appText.dart';
import '../../../../core/base/custom_app_bar.dart';
import '../../../../core/base/custom_app_button.dart';
import '../../../../core/utils/app_colors.dart';

class ConfirmJobDetailsScreen extends StatelessWidget {
  const ConfirmJobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: "Confirm Job Details",
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                children: [
                  _buildMainDetailsCard(),
                  const SizedBox(height: 16),
                  _buildServiceRateSection(),
                  const SizedBox(height: 16),
                  _buildCreditsSection(),
                  const SizedBox(height: 16),
                  _buildCostInfoBox(),
                  const SizedBox(height: 16),
                  _buildFeeWarning(),
                  const SizedBox(height: 24),
                  _buildProtectionBadge(),
                  const SizedBox(height: 24),

                  
                  // Info Box
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDBEAFE), // Light blue
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.credit_card_outlined, color: Color(0xFF3B82F6), size: 20),
                        const SizedBox(width: 12),
                        Expanded(
                          child: AppText(
                            "You won't charged for the job until it is complete.",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF0F172A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Add Payment Method Button
                  CustomAppButton(
                    text: "Confirmed & post",
                    onTap: () {},
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainDetailsCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
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
          // Header
          Row(
            children: [
              Image.asset('assets/images/Ellipse.png', width: 70, height: 70),
              const SizedBox(width: 12),
              AppText(
                "Appliance install",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF0F172A),
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          // Date and Time
          AppText(
            "Date and Time requested",
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF0F172A),
          ),
          const SizedBox(height: 12),
          _buildDateRow("Tue 21, 2026", "Aft"),
          const SizedBox(height: 24),
          
          // Address Details
          AppText(
            "Address Details",
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF0F172A),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.location_on, color: Color(0xFF0F172A), size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: AppText(
                  "123 Lorem Street, Unit 4B Sample City, ON A1A 1A1",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF64748B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          // Timing Constraints
          AppText(
            "Timing Constraints",
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF0F172A),
          ),
          const SizedBox(height: 12),
          AppText(
            "I need a new appliance installed and connected properly in my home. Please inspect the installation area, set up the appliance securely, connect the required power or water lines, and test it to ensure everything is working correctly. Let me know before making any additional adjustments or using extra materials.",
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF64748B),
          ),
          const SizedBox(height: 24),
          
          // Photo & Video
          AppText(
            "Photo & Video",
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF0F172A),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "https://picsum.photos/seed/house/100/100",
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: AppText(
                    "Add a short caption (optional)",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF94A3B8),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          // Need to cancel Box
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9), // Light gray
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  "Need to cancel? No problm!",
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF0F172A),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: 'SfPro-Regular',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF64748B),
                      height: 1.5,
                    ),
                    children: [
                      TextSpan(text: "Cancel free of charge at any time until your pro is on their way to the job, "),
                      TextSpan(
                        text: "Learn more",
                        style: TextStyle(color: Color(0xFF3B82F6), decoration: TextDecoration.underline), // Blue link
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateRow(String date, String time) {
    return Row(
      children: [
        const Icon(Icons.calendar_today_outlined, size: 18, color: Color(0xFF64748B)),
        const SizedBox(width: 12),
        AppText(
          date,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF0F172A),
        ),
        const SizedBox(width: 4),
        AppText(
          "($time)",
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF94A3B8),
        ),
      ],
    );
  }

  Widget _buildServiceRateSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          "Service Rate",
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF0F172A),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              "For the first 2 hours",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF0F172A),
            ),
            AppText(
              "\$120",
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF0F172A),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              "For each additional hour",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF64748B),
            ),
            AppText(
              "\$85",
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF64748B),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCreditsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              "Credits & Coupons",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF0F172A),
            ),
            AppText(
              "\$0",
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF0F172A),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.local_activity_outlined, size: 16, color: Color(0xFF64748B)),
              const SizedBox(width: 8),
              AppText(
                "I have a promo code",
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF0F172A),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCostInfoBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            "How much will my job cost?",
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF0F172A),
          ),
          const SizedBox(height: 8),
          AppText(
            "Once you match with a Pro, you can chat with them in the app to get a better idea of how much the job might cost before it starts.",
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF64748B),
          ),
        ],
      ),
    );
  }

  Widget _buildFeeWarning() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.verified, color: Color(0xFFF59E0B), size: 20), // Yellow badge
        const SizedBox(width: 12),
        Expanded(
          child: RichText(
            text: const TextSpan(
              style: TextStyle(
                fontFamily: 'SfPro-Regular',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF0F172A),
                height: 1.5,
              ),
              children: [
                TextSpan(text: "A "),
                TextSpan(
                  text: "2.9% ",
                  style: TextStyle(color: Color(0xFFF59E0B)), // Orange-yellow
                ),
                TextSpan(text: "fee will be added to support our Homeowner Protection Promise."),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProtectionBadge() {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            color: Color(0xFFFEF3C7), // Light yellow
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Icon(Icons.verified, color: Color(0xFFF59E0B), size: 32),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                "You're Protected with Aerofix",
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF0F172A),
              ),
              const SizedBox(height: 4),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontFamily: 'SfPro-Regular',
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF64748B),
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(text: "If your experience isn't perfect, we'll make it right. "),
                    TextSpan(
                      text: "Learn More",
                      style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF0F172A)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
