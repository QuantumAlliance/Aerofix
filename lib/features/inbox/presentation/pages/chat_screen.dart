import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/base/appText.dart';
import '../../../../core/base/custom_app_bar.dart';
import '../../../../core/base/custom_text_field.dart';
import '../../../../core/route/route.dart';
import '../../../../core/utils/app_colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isChatSelected = true;

  final List<Map<String, dynamic>> dummyChats = [
    {
      "name": "Liam Carter",
      "subtitle": "Sent a file",
      "unread": 1,
      "img": "1",
    },
    {
      "name": "Liam O'Sullivan",
      "subtitle": "Commented on the project",
      "unread": 1,
      "img": "2",
    },
    {
      "name": "Maya Chen",
      "subtitle": "Uploaded images",
      "unread": 0,
      "img": "3",
    },
    {
      "name": "Ethan Kim",
      "subtitle": "Reviewed the document",
      "unread": 0,
      "img": "4",
    },
    {
      "name": "Sofia Martinez",
      "subtitle": "Shared a link",
      "unread": 0,
      "img": "5",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: "Chat",
        isTransparent: true,
        showBackButton: false,
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
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  
                  // Toggle Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => isChatSelected = true),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: isChatSelected ? AppColors.mainAppColor : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: isChatSelected ? null : Border.all(color: const Color(0xFFE2E8F0)),
                              ),
                              alignment: Alignment.center,
                              child: AppText(
                                "Chat",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: isChatSelected ? Colors.white : const Color(0xFF0F172A),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => isChatSelected = false),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: !isChatSelected ? AppColors.mainAppColor : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: !isChatSelected ? null : Border.all(color: const Color(0xFFE2E8F0)),
                              ),
                              alignment: Alignment.center,
                              child: AppText(
                                "Support",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: !isChatSelected ? Colors.white : const Color(0xFF0F172A),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  if (isChatSelected) ...[
                    // Search Field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextField(
                        hintText: "Search Here...",
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.search, color: Color(0xFF64748B)),
                        textEditingController: TextEditingController(),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Chat List
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        itemCount: dummyChats.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final chat = dummyChats[index];
                          return GestureDetector(
                            onTap: () => Get.toNamed(AppRoutes.chatDetailsScreen, arguments: chat["name"]),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: const Color(0xFFE2E8F0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.02),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      "https://i.pravatar.cc/150?img=${chat['img']}",
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
                                          chat["name"],
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF0F172A),
                                        ),
                                        const SizedBox(height: 4),
                                        AppText(
                                          chat["subtitle"],
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF64748B),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (chat["unread"] > 0)
                                    Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFE2E8F0),
                                        shape: BoxShape.circle,
                                      ),
                                      child: AppText(
                                        chat["unread"].toString(),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF0F172A),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ] else ...[
                    // Empty State for Support
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.inbox_outlined,
                              size: 80,
                              color: Color(0xFF94A3B8),
                            ),
                            const SizedBox(height: 24),
                            AppText(
                              "No new messages",
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF0F172A),
                            ),
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40),
                              child: AppText(
                                "Check back for offers and important\nnotifications",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF64748B),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 24),
                            InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE2E8F0),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: AppText(
                                  "Refresh",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF0F172A),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
