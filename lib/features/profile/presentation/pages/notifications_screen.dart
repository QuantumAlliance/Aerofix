import 'package:flutter/material.dart';
import '../../../../core/base/appText.dart';
import '../../../../core/base/custom_app_bar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: "Notifications",
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
                // Header Row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        "New",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF0F172A),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: AppText(
                          "Mark all as read",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF334155),
                        ),
                      ),
                    ],
                  ),
                ),
                
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      _buildNotificationItem(
                        icon: Icons.calendar_today_outlined,
                        title: "Booking confirmed",
                        subtitle: "Your booking for plumbing service on May 25, 2026 at 10:00 AM has been confirmed.",
                        time: "00.56 AM",
                        iconColor: const Color(0xFF3B82F6),
                        bgColor: const Color(0xFFE0F2FE),
                      ),
                      _buildNotificationItem(
                        icon: Icons.person_outline,
                        title: "Technician assigned",
                        subtitle: "Your ride to down town has ended successfully.",
                        time: "00.56 AM",
                        iconColor: const Color(0xFF3B82F6),
                        bgColor: const Color(0xFFE0F2FE),
                      ),
                      _buildNotificationItem(
                        icon: Icons.notifications_none_outlined,
                        title: "Job completed",
                        subtitle: "Your plumbing service has been completed. Please rate your experience.",
                        time: "00.03 AM",
                        iconColor: const Color(0xFF3B82F6),
                        bgColor: const Color(0xFFE0F2FE),
                      ),
                      
                      const SizedBox(height: 16),
                      AppText(
                        "Yesterday",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF0F172A),
                      ),
                      const SizedBox(height: 12),
                      
                      _buildNotificationItem(
                        icon: Icons.local_offer_outlined,
                        title: "Special offer",
                        subtitle: "Get 10% off on your next booking.\nUse code: Aerofix10star.",
                        time: "09.23 PM",
                        iconColor: const Color(0xFF3B82F6),
                        bgColor: const Color(0xFFE0F2FE),
                      ),
                      _buildNotificationItem(
                        icon: Icons.local_offer_outlined, // Same icon for promo
                        title: "Promo available",
                        subtitle: "get 10% off your next ride with swiftRides.",
                        time: "00.56 AM",
                        iconColor: const Color(0xFF0F172A),
                        bgColor: const Color(0xFFF1F5F9), // Gray background
                      ),
                      _buildNotificationItem(
                        icon: Icons.receipt_long_outlined,
                        title: "Payment successful",
                        subtitle: "Your payment of \$24.00 has been processed.",
                        time: "00.03 AM",
                        iconColor: const Color(0xFF0F172A),
                        bgColor: const Color(0xFFF1F5F9), // Gray background
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

  Widget _buildNotificationItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
    required Color iconColor,
    required Color bgColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      title,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF0F172A),
                    ),
                    AppText(
                      time,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF94A3B8),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                AppText(
                  subtitle,
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
}
