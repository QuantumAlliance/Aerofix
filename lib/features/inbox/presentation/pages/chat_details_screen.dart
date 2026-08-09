import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/base/appText.dart';
import '../../../../core/base/custom_app_bar.dart';
import '../../../../core/utils/app_colors.dart';

class ChatDetailsScreen extends StatelessWidget {
  const ChatDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String chatName = Get.arguments as String? ?? "Liam Carter";

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: chatName,
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
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      children: [
                        _buildMessageBubble(
                          text: "I'm interested in building lean muscle.",
                          senderName: "Alex",
                          isMe: true,
                          color: AppColors.mainAppColor,
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: 12),
                        _buildMessageBubble(
                          text: "Okay, we can definitely work on that.",
                          senderName: "Liam Carter",
                          isMe: false,
                          color: const Color(0xFFF1F5F9),
                          textColor: const Color(0xFF0F172A),
                        ),
                        const SizedBox(height: 12),
                        _buildMessageBubble(
                          text: "I'm interested in building lean muscle.",
                          senderName: "Alex",
                          isMe: true,
                          color: AppColors.mainAppColor,
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: 12),
                        _buildMessageBubble(
                          text: "Okay, we can definitely work on that.",
                          senderName: "Liam Carter",
                          isMe: false,
                          color: const Color(0xFFF1F5F9),
                          textColor: const Color(0xFF0F172A),
                        ),
                        
                        // Time Divider
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            children: [
                              const Expanded(child: Divider(color: Color(0xFFE2E8F0))),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: AppText(
                                  "11:15 AM",
                                  fontSize: 10,
                                  color: const Color(0xFF64748B),
                                ),
                              ),
                              const Expanded(child: Divider(color: Color(0xFFE2E8F0))),
                            ],
                          ),
                        ),
                        
                        _buildMessageBubble(
                          text: "I try to eat a balanced diet, but I'm not sure if I'm getting enough protein.",
                          senderName: "Alex",
                          isMe: true,
                          color: AppColors.mainAppColor,
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: 12),
                        _buildMessageBubble(
                          text: "Okay, we can definitely work on that.",
                          senderName: "Admin",
                          isMe: false,
                          color: const Color(0xFFC4B5FD),
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  
                  // Message Input Field
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(top: BorderSide(color: Color(0xFFE2E8F0))),
                    ),
                    child: SafeArea(
                      top: false,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: const Color(0xFFE2E8F0)),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.camera_alt_outlined, color: Color(0xFF64748B)),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Type a message...",
                                        hintStyle: TextStyle(
                                          fontFamily: 'SfPro-Regular',
                                          fontSize: 14,
                                          color: const Color(0xFF64748B),
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.mainAppColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.send, color: Colors.white, size: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble({
    required String text,
    required String senderName,
    required bool isMe,
    required Color color,
    required Color textColor,
  }) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isMe ? 16 : 0),
            bottomRight: Radius.circular(isMe ? 0 : 16),
          ),
        ),
        child: Column(
          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            AppText(
              senderName,
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: isMe ? Colors.white.withOpacity(0.8) : color.withOpacity(0.8), // Adjust as needed
            ),
            const SizedBox(height: 4),
            AppText(
              text,
              fontSize: 14,
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
