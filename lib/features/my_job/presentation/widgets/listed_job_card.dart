import 'package:flutter/material.dart';
import '../../../../../core/base/appText.dart';

class ListedJobCard extends StatelessWidget {
  final String name;
  final String status;
  final Color statusColor;
  final Color statusBgColor;
  final String role;
  final String date;
  final String jobTitle;
  final String description;

  const ListedJobCard({
    super.key,
    required this.name,
    required this.status,
    required this.statusColor,
    required this.statusBgColor,
    required this.role,
    required this.date,
    required this.jobTitle,
    required this.description,
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
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                name,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF0F172A),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusBgColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: AppText(
                  status,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: statusColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Role & Date
          Row(
            children: [
              const Icon(Icons.person, size: 16, color: Color(0xFF64748B)),
              const SizedBox(width: 8),
              AppText(
                role,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF64748B),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.calendar_today_outlined, size: 16, color: Color(0xFF64748B)),
              const SizedBox(width: 8),
              AppText(
                date,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF64748B),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Job Title & Description
          AppText(
            jobTitle,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF0F172A),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: AppText(
                  description,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF64748B),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right, color: Color(0xFF64748B)),
            ],
          ),
        ],
      ),
    );
  }
}
