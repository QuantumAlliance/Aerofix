import 'package:flutter/material.dart';
import '../../../../../core/base/appText.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final double rating;
  final String time;
  final String image;
  final String review;

  const ReviewCard({
    super.key,
    required this.name,
    required this.rating,
    required this.time,
    required this.image,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
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
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  image,
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      name,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF0F172A),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Color(0xFFF59E0B), size: 12),
                        const SizedBox(width: 4),
                        AppText(
                          "$rating • $time",
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF64748B),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_vert, color: Color(0xFF94A3B8), size: 20),
            ],
          ),
          const SizedBox(height: 12),
          AppText(
            review,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF334155),
          ),
        ],
      ),
    );
  }
}
