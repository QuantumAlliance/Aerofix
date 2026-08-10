import 'package:flutter/material.dart';
import '../../../../core/base/appText.dart';
import '../../../../core/base/custom_app_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/review_card.dart';

class TechnicianReviewsScreen extends StatelessWidget {
  const TechnicianReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: "Customer Reviews",
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          // Ratings Summary
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      AppText(
                        "4.5",
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF0F172A),
                      ),
                      AppText(
                        "5k Reviews",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF64748B),
                      ),
                    ],
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: Column(
                      children: [
                        _buildRatingBar(5, 0.8),
                        const SizedBox(height: 4),
                        _buildRatingBar(4, 0.6),
                        const SizedBox(height: 4),
                        _buildRatingBar(3, 0.4),
                        const SizedBox(height: 4),
                        _buildRatingBar(2, 0.2),
                        const SizedBox(height: 4),
                        _buildRatingBar(1, 0.1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: AppText(
                "Recent",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF0F172A),
              ),
            ),
          ),
          const SizedBox(height: 12),
          
          // Reviews List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 8),
              itemCount: 3,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const ReviewCard(
                    name: "Ethan J. Wang",
                    rating: 4.6,
                    time: "5h ago",
                    image: "https://i.pravatar.cc/150?img=8",
                    review: "Training with coach Aisha Khan has boosted my endurance significantly. The tailored cardio workouts keep me motivated every day.",
                  );
                } else if (index == 1) {
                  return const ReviewCard(
                    name: "Charles D. Xavier",
                    rating: 4.5,
                    time: "3d ago",
                    image: "https://i.pravatar.cc/150?img=7",
                    review: "I've been practicing my glutes with coach Seraphina Dubois for the past week, and I feel better! The personalized recommendation is...",
                  );
                } else {
                  return const ReviewCard(
                    name: "Lena M. Carter",
                    rating: 4.8,
                    time: "1d ago",
                    image: "https://i.pravatar.cc/150?img=9",
                    review: "The yoga sessions with instructor Mateo Rivera have transformed my flexibility and mindset. Highly recommend his calming appr...",
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBar(int star, double percentage) {
    return Row(
      children: [
        AppText(
          star.toString(),
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF64748B),
        ),
        const SizedBox(width: 4),
        const Icon(Icons.star, color: Color(0xFFF59E0B), size: 10),
        const SizedBox(width: 8),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFFE2E8F0),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              FractionallySizedBox(
                widthFactor: percentage,
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColors.mainAppColor,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
