import 'package:flutter/material.dart';
import '../../../../../core/base/appText.dart';
import '../../../../../core/utils/app_colors.dart';

class OfferCard extends StatelessWidget {
  final String profileImage;
  final String name;
  final String role;
  final double rating;
  final String experience;
  final String availabilityTitle;
  final String availabilityTime;
  final String priceEstimate;
  final String jobsCompleted;
  final VoidCallback onViewProfile;
  final VoidCallback onHireTechnician;

  const OfferCard({
    super.key,
    required this.profileImage,
    required this.name,
    required this.role,
    required this.rating,
    required this.experience,
    required this.availabilityTitle,
    required this.availabilityTime,
    required this.priceEstimate,
    required this.jobsCompleted,
    required this.onViewProfile,
    required this.onHireTechnician,
  });

  @override
  Widget build(BuildContext context) {
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
          // Profile Info Header
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  profileImage,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              
              // Name, Role & Rating
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      name,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF0F172A),
                    ),
                    const SizedBox(height: 4),
                    AppText(
                      role,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF334155),
                    ),
                    const SizedBox(height: 4),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Icon(Icons.star, color: Color(0xFFF59E0B), size: 14),
                        const SizedBox(width: 4),
                        AppText(
                          rating.toString(),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF0F172A),
                        ),
                        const SizedBox(width: 8),
                        AppText(
                          experience,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF64748B),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Availability Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFD1FAE5), // Light green
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    AppText(
                      availabilityTitle,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF059669), // Darker green text
                    ),
                    const SizedBox(height: 2),
                    AppText(
                      availabilityTime,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF0F172A),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(color: Color(0xFFE2E8F0), height: 1),
          ),
          
          // Stats Row
          Row(
            children: [
              // Price Estimate
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.mainAppColor),
                      ),
                      child: const Icon(Icons.attach_money, color: AppColors.mainAppColor, size: 16),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          "Price Estimate",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF64748B),
                        ),
                        const SizedBox(height: 2),
                        AppText(
                          priceEstimate,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF0F172A),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Jobs Completed
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.mainAppColor),
                      ),
                      child: const Icon(Icons.work_outline, color: AppColors.mainAppColor, size: 16),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          "Jobs Completed",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF64748B),
                        ),
                        const SizedBox(height: 2),
                        AppText(
                          jobsCompleted,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF0F172A),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // Buttons
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: OutlinedButton(
                    onPressed: onViewProfile,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFE2E8F0)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: AppText(
                      "View Profile",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF0F172A),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: onHireTechnician,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainAppColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: AppText(
                      "Hire Technician",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
