import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import '../../../../core/base/appText.dart';
import '../../../../core/base/custom_app_bar.dart';
import '../../../../core/utils/app_colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // Job Notifications state
  final _bookingUpdates = ValueNotifier<bool>(true);
  final _technicianUpdates = ValueNotifier<bool>(true);
  final _messages = ValueNotifier<bool>(true);
  final _paymentAlerts = ValueNotifier<bool>(true);

  // System & Updates state
  final _systemNotification = ValueNotifier<bool>(true);
  final _promotionsOffers = ValueNotifier<bool>(false);

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

          // Content
          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    
                    // Job Notifications
                    AppText(
                      "Job Notifications",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF0F172A),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                      ),
                      child: Column(
                        children: [
                          _buildNotificationItem(
                            icon: Icons.calendar_today_outlined,
                            title: "Booking updates",
                            subtitle: "Get notified about booking confirmation, rescheduling, and cancellation.",
                            controller: _bookingUpdates,
                          ),
                          const Divider(height: 1, color: Color(0xFFE2E8F0)),
                          _buildNotificationItem(
                            icon: Icons.work_outline,
                            title: "Technician updates",
                            subtitle: "Receive update when technician is assigned, on the way, or has arrived.",
                            controller: _technicianUpdates,
                          ),
                          const Divider(height: 1, color: Color(0xFFE2E8F0)),
                          _buildNotificationItem(
                            icon: Icons.chat_bubble_outline,
                            title: "Messages",
                            subtitle: "Get notified about new messages from technicians and support.",
                            controller: _messages,
                          ),
                          const Divider(height: 1, color: Color(0xFFE2E8F0)),
                          _buildNotificationItem(
                            icon: Icons.account_balance_wallet_outlined,
                            title: "Payment alerts",
                            subtitle: "Get notified about payment confirmation, refund, and due reminders.",
                            controller: _paymentAlerts,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // System & Updates
                    AppText(
                      "System & Updates",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF0F172A),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                      ),
                      child: Column(
                        children: [
                          _buildNotificationItem(
                            icon: Icons.notifications_none,
                            title: "system notification", // Lowercase per design
                            subtitle: "Important update about announcement from Aerofix.",
                            controller: _systemNotification,
                          ),
                          const Divider(height: 1, color: Color(0xFFE2E8F0)),
                          _buildNotificationItem(
                            icon: Icons.local_offer_outlined,
                            title: "Promotions & Offers",
                            subtitle: "Receive offers, discounts, and promotional updates.",
                            controller: _promotionsOffers,
                          ),
                        ],
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

  Widget _buildNotificationItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required ValueNotifier<bool> controller,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Icon(icon, color: const Color(0xFF64748B), size: 20),
          ),
          const SizedBox(width: 16),
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
                AppText(
                  subtitle,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF64748B),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          AdvancedSwitch(
            controller: controller,
            activeColor: AppColors.mainAppColor,
            inactiveColor: const Color(0xFFE2E8F0),
            width: 44,
            height: 24,
          ),
        ],
      ),
    );
  }
}
