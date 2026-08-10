import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/base/appText.dart';
import '../../../../core/base/custom_app_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/route/route.dart';
import '../widgets/review_card.dart';

class TechnicianProfileScreen extends StatelessWidget {
  const TechnicianProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: "Technician Profile",
        isTransparent: true,
        actionWidget: GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(Icons.chat_bubble_outline, color: Color(0xFF0F172A), size: 20),
          ),
        ),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        _buildProfileCard(),
                        const SizedBox(height: 24),
                        
                        _buildSectionTitle("About Liam Carter"),
                        const SizedBox(height: 12),
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
                              TextSpan(text: "James Carter is a certified electrician with 8 years of experience. He specializes in residential and commercial wiring, completing numerous projects from home... "),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        _buildSectionTitle("Skills & Services"),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            _buildSkillChip("Wiring"),
                            _buildSkillChip("Repairing"),
                            _buildSkillChip("Repairing"),
                            _buildSkillChip("Wiring"),
                            _buildSkillChip("Repairing"),
                            _buildSkillChip("Repairing"),
                          ],
                        ),
                        const SizedBox(height: 24),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildSectionTitle("Customer Reviews"),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.technicianReviewsScreen);
                              },
                              child: AppText(
                                "See all",
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.mainAppColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const ReviewCard(
                          name: "Lena M. Carter",
                          rating: 4.8,
                          time: "1d ago",
                          image: "https://i.pravatar.cc/150?img=9",
                          review: "The yoga sessions with instructor Mateo Rivera have transformed my flexibility and mindset. Highly recommend his calming appr...",
                        ),
                        const SizedBox(height: 24),
                        
                        _buildSectionTitle("Apply to your job"),
                        const SizedBox(height: 12),
                        _buildAppliedJobCard(),
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
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: OutlinedButton(
                            onPressed: () {
                              _showDeclineOfferBottomSheet(context);
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFFE2E8F0)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: AppText(
                              "Decline Offer",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF0F172A),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.confirmTechnicianScreen);
                            },
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
                                const Icon(Icons.work_outline, color: Colors.white, size: 20),
                                const SizedBox(width: 8),
                                AppText(
                                  "Hire Technician",
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
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return AppText(
      title,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF0F172A),
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
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    const SizedBox(height: 4),
                    AppText(
                      "Electrician",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF334155),
                    ),
                    const SizedBox(height: 4),
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
          const SizedBox(height: 16),
          
          // Verification badges
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFD1FAE5), // Light green
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    _buildVerificationBadge("Background check"),
                    const SizedBox(width: 16),
                    _buildVerificationBadge("ID verified"),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildVerificationBadge("License verified"),
                    const SizedBox(width: 16),
                    _buildVerificationBadge("Insurance verified"),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          
          const Divider(height: 1, color: Color(0xFFE2E8F0)),
          const SizedBox(height: 16),
          
          // Stats
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.mainAppColor),
                      ),
                      child: const Icon(Icons.work_outline, color: AppColors.mainAppColor, size: 16),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          "Jobs completed",
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF64748B),
                        ),
                        const SizedBox(height: 2),
                        AppText(
                          "123",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF0F172A),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 40,
                color: const Color(0xFFE2E8F0),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.mainAppColor),
                      ),
                      child: const Icon(Icons.location_on_outlined, color: AppColors.mainAppColor, size: 16),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            "Service area.",
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF64748B),
                          ),
                          const SizedBox(height: 2),
                          AppText(
                            "Wireless gate, Dhaka",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF0F172A),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVerificationBadge(String text) {
    return Expanded(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: AppColors.mainAppColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 10),
          ),
          const SizedBox(width: 8),
          AppText(
            text,
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF0F172A),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: AppColors.mainAppColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 10),
          ),
          const SizedBox(width: 8),
          AppText(
            skill,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF0F172A),
          ),
        ],
      ),
    );
  }

  // _buildReviewCard extracted to ReviewCard widget
  
  Widget _buildAppliedJobCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                "Liam Carter",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF0F172A),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFDBEAFE),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: AppText(
                  "New",
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF3B82F6),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.person, size: 14, color: Color(0xFF64748B)),
              const SizedBox(width: 8),
              AppText(
                "Professional Repair Man",
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF64748B),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.calendar_today_outlined, size: 14, color: Color(0xFF64748B)),
              const SizedBox(width: 8),
              AppText(
                "21 May 2026 (Aft) • 10:00 Am",
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF64748B),
              ),
            ],
          ),
          const SizedBox(height: 12),
          AppText(
            "Appliance install",
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF0F172A),
          ),
          const SizedBox(height: 6),
          AppText(
            "I need a new appliance installed and connected properly in my home. Please inspect the install...",
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF64748B),
          ),
        ],
      ),
    );
  }

  // Reviews screen extracted to technician_reviews_screen.dart
  
  void _showDeclineOfferBottomSheet(BuildContext context) {
    int selectedReason = 0;
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppColors.mainAppColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Trash Icon
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEE2E2), // Light red
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.delete_outline, color: Color(0xFFEF4444), size: 24),
                      ),
                      const SizedBox(height: 16),
                      
                      AppText(
                        "Decline this offer?",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF0F172A),
                      ),
                      const SizedBox(height: 8),
                      
                      AppText(
                        "This technician will be removed from your offer list. You can continue reviewing other technicians.",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF64748B),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      
                      Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontFamily: 'SfPro-Regular',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0F172A),
                            ),
                            children: [
                              TextSpan(text: "Reason "),
                              TextSpan(
                                text: "(Optional)",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF64748B),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      
                      // Options
                      _buildReasonOption(
                        "Not enough experience", 
                        selectedReason == 0, 
                        () => setState(() => selectedReason = 0)
                      ),
                      const SizedBox(height: 12),
                      _buildReasonOption(
                        "Skills do not match", 
                        selectedReason == 1, 
                        () => setState(() => selectedReason = 1)
                      ),
                      const SizedBox(height: 12),
                      _buildReasonOption(
                        "Not Verified", 
                        selectedReason == 2, 
                        () => setState(() => selectedReason = 2)
                      ),
                      const SizedBox(height: 12),
                      _buildReasonOption(
                        "Other", 
                        selectedReason == 3, 
                        () => setState(() => selectedReason = 3)
                      ),
                      const SizedBox(height: 16),
                      
                      // Text Field
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: TextField(
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: "Share more details (optional)",
                            hintStyle: const TextStyle(
                              fontFamily: 'SfPro-Regular',
                              fontSize: 12,
                              color: Color(0xFF94A3B8),
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Buttons
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 48,
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: Color(0xFFE2E8F0)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: AppText(
                                  "Keep Offer",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF0F172A),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: SizedBox(
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () {
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFEF4444), // Red color
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: AppText(
                                  "Decline offer",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30)
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildReasonOption(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.mainAppColor : const Color(0xFF94A3B8),
                  width: isSelected ? 5 : 1.5,
                ),
              ),
            ),
            const SizedBox(width: 12),
            AppText(
              text,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF334155),
            ),
          ],
        ),
      ),
    );
  }
}
