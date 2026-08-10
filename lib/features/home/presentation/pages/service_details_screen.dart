import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../core/base/appText.dart';
import '../../../../core/base/custom_app_bar.dart';
import '../../../../core/base/custom_app_button.dart';
import '../../../../core/base/custom_text_field.dart';
import '../../../../core/route/route.dart';
import '../../../../core/utils/app_colors.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: "Service Details",
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
                  _buildMainCard(context),
                  const SizedBox(height: 16),
                  _buildChecklistCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
      ),
      child: Column(
        children: [
          // Header Image & Title
          Image.asset('assets/images/Ellipse.png', width: 70, height: 70),
          const SizedBox(height: 8),
          AppText(
            "Appliance install",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF0F172A),
          ),
          const SizedBox(height: 12),
          AppText(
            "Technician can install or uninstall almost all makes and models of appliance for gas stove range. Please request in gas service category.",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF64748B),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // Pricing Box 1
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFE0F2FE), // Light blue
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                AppText(
                  "\$108 for the first applince",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF0F172A),
                ),
                const SizedBox(height: 4),
                AppText(
                  "+\$90 for each additional appliance",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF64748B),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Fee Info Text
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(
                fontFamily: 'SfPro-Regular',
                fontSize: 14,
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
                TextSpan(text: "fee will be added to support our Homeowner Protection Promise. "),
                TextSpan(
                  text: "Learn More",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Pricing Box 2
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFE0F2FE), // Light blue
              borderRadius: BorderRadius.circular(12),
            ),
            child: AppText(
              "Rate is 2X if 2 techs are needed for large appliances or stacked units. Add \$50 for disposal of old appliance(s). Parts, along with any duct work, if required, are extra and will be quoted by your Pro. Miele, Wolf and Sub-Zero are 1.5X regular rates.",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF0F172A),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),

          // Where do you need...
          Align(
            alignment: Alignment.centerLeft,
            child: AppText(
              "Where do you need a Aerofix?",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 12),

          // Location Field (Tappable)
          GestureDetector(
            onTap: () => _showAddAddressBottomSheet(context),
            child: AbsorbPointer(
              child: CustomTextField(
                hintText: "Search Here...",
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.location_on, color: Color(0xFF3B82F6)), // Blue location pin
                textEditingController: TextEditingController(),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Get Started Button
          CustomAppButton(
            text: "Get Started",
            onTap: () {
              Get.toNamed(AppRoutes.requestJobScreen);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildChecklistCard() {
    final list = [
      "Dishwasher Install",
      "Washer Install",
      "Dryer Install",
      "Range Install",
      "Fridge Install",
      "Hood Fan Install",
      "Appliance Uninstallation",
      "Garbage Disposal Install",
    ];

    return Container(
      width: double.infinity,
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
          AppText(
            "Customers use this service for",
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF0F172A),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 12,
            children: list.map((item) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check, size: 16, color: Color(0xFF64748B)),
                  const SizedBox(width: 8),
                  AppText(
                    item,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF0F172A),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  void _showAddAddressBottomSheet(BuildContext context) {
    int selectedType = 0; // 0: Home, 1: Rental, 2: Office

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Drag handle
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE2E8F0),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Title and Close button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 24), // For balance
                        AppText(
                          "Address Details",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF0F172A),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.close, color: Color(0xFF64748B)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Address Types
                    Row(
                      children: [
                        _buildAddressTypeButton(
                          "Home",
                          "assets/icons/HomeU.svg",
                          selectedType == 0,
                          () => setState(() => selectedType = 0),
                        ),
                        const SizedBox(width: 12),
                        _buildAddressTypeButton(
                          "Rental property",
                          "assets/icons/apartmentIcon.svg",
                          selectedType == 1,
                          () => setState(() => selectedType = 1),
                        ),
                        const SizedBox(width: 12),
                        _buildAddressTypeButton(
                          "Office",
                          "assets/icons/officeIcon.svg",
                          selectedType == 2,
                          () => setState(() => selectedType = 2),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // TextFields
                    CustomTextField(
                      textEditingController: TextEditingController(),
                      hintText: 'Location nickname',
                      hintStyle: const TextStyle(
                        fontFamily: 'SfPro-Regular',
                        fontSize: 14,
                        color: Color(0xFF64748B),
                      ),
                      fillColor: Colors.white,
                    ),
                    const SizedBox(height: 16),
                    
                    CustomTextField(
                      textEditingController: TextEditingController(),
                      hintText: 'Street Address',
                      hintStyle: const TextStyle(
                        fontFamily: 'SfPro-Regular',
                        fontSize: 14,
                        color: Color(0xFF64748B),
                      ),
                      fillColor: Colors.white,
                    ),
                    const SizedBox(height: 16),
                    
                    CustomTextField(
                      textEditingController: TextEditingController(),
                      hintText: 'Unit/Suite',
                      hintStyle: const TextStyle(
                        fontFamily: 'SfPro-Regular',
                        fontSize: 14,
                        color: Color(0xFF64748B),
                      ),
                      fillColor: Colors.white,
                    ),
                    const SizedBox(height: 24),

                    // Save Button
                    CustomAppButton(
                      text: "Save",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        );
      }
    );
  }

  Widget _buildAddressTypeButton(String title, String iconPath, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFF0FDF4) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? const Color(0xFF10B981) : const Color(0xFFE2E8F0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Use Icon for placeholder if SVG is missing, otherwise SvgPicture
              Icon(
                Icons.home, // Placeholder
                size: 16,
                color: isSelected ? const Color(0xFF10B981) : const Color(0xFF64748B),
              ),
              const SizedBox(width: 4),
              Flexible(
                child: AppText(
                  title,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: isSelected ? const Color(0xFF10B981) : const Color(0xFF0F172A),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
