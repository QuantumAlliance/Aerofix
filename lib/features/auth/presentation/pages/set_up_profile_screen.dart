import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';

import '../../../../core/base/appText.dart';
import '../../../../core/base/custom_app_button.dart';
import '../../../../core/base/custom_text_field.dart';
import '../../../../core/route/route.dart';
import '../../../../core/utils/app_colors.dart';

class SetUpProfileScreen extends StatelessWidget {
  SetUpProfileScreen({super.key});

  final TextEditingController addressController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
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
                scale: 1.2,
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/dotedTopImg.png',
                  fit: BoxFit.fitWidth,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(),
                ),
              ),
            ),
          ),
          
          // Form Content
          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.04),

                    // Logo
                    SvgPicture.asset(
                      'assets/icons/mainIconBlack.svg',
                    ),
                    const SizedBox(height: 10),

                    // Title
                    AppText(
                      "Set Up Your Profile",
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF0F172A),
                    ),
                    const SizedBox(height: 12),

                    // Description
                    AppText(
                      "Add your address details so we can connect you with the right services in your area.",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF64748B),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),

                    // Default Address
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        "Default Address",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    SizedBox(height: 5),
                    CustomTextField(
                      textEditingController: addressController,
                      hintText: '123 Lorem Lane',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 14, bottom: 14, top: 14, right: 10),
                        child: SvgPicture.asset(
                          "assets/icons/locationIcon.svg",
                        ),
                      ),
                      hintStyle: TextStyle(
                        fontFamily: 'SfPro-Regular',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                      fillColor: const Color(0xFFFFFFFF),
                    ),
                    SizedBox(height: 14),

                    // Unit/Apartment Number (Optional)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          text: 'Unit/Apartment Number ',
                          style: const TextStyle(
                            fontFamily: 'SfPro-Regular',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF0F172A),
                          ),
                          children: const [
                            TextSpan(
                              text: '(Optional)',
                              style: TextStyle(
                                color: Color(0xFF94A3B8),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    CustomTextField(
                      textEditingController: unitController,
                      hintText: 'e.g. Unit 4B, Apt 123',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 14, bottom: 14, top: 14, right: 10),
                        child: SvgPicture.asset(
                          "assets/icons/apartmentIcon.svg",
                        ),
                      ),
                      hintStyle: TextStyle(
                        fontFamily: 'SfPro-Regular',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                      fillColor: const Color(0xFFFFFFFF),
                    ),
                    SizedBox(height: 14),

                    // City
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        "City",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    SizedBox(height: 5),
                    CustomTextField(
                      textEditingController: cityController,
                      hintText: 'Sampletown',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 14, bottom: 14, top: 14, right: 10),
                        child: SvgPicture.asset(
                          "assets/icons/CityIcon.svg",
                        ),
                      ),
                      hintStyle: TextStyle(
                        fontFamily: 'SfPro-Regular',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                      fillColor: const Color(0xFFFFFFFF),
                    ),
                    SizedBox(height: 14),

                    // City / Province (following image exactly)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        "Province",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    SizedBox(height: 5),
                    CustomTextField(
                      textEditingController: provinceController,
                      hintText: 'Select Province',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 14, bottom: 14, top: 14, right: 10),
                        child: SvgPicture.asset(
                          "assets/icons/mapIcon.svg",
                        ),
                      ),
                      hintStyle: TextStyle(
                        fontFamily: 'SfPro-Regular',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                      fillColor: const Color(0xFFFFFFFF),
                    ),
                    SizedBox(height: 14),

                    // Postal Code
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        "Postal Code",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    SizedBox(height: 5),
                    CustomTextField(
                      textEditingController: postalCodeController,
                      hintText: 'Select Province',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 14, bottom: 14, top: 14, right: 10),
                        child: SvgPicture.asset(
                          "assets/icons/postalIcon.svg",
                        ),
                      ),
                      hintStyle: TextStyle(
                        fontFamily: 'SfPro-Regular',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                      fillColor: const Color(0xFFFFFFFF),
                    ),
                    SizedBox(height: 24),

                    // Addresses Title
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        "Addresses",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    SizedBox(height: 12),

                    // Primary Address Card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/HomeU.svg",
                            width: 20,
                            height: 20,
                            colorFilter: const ColorFilter.mode(AppColors.mainAppColor, BlendMode.srcIn),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD1FAE5),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: AppText(
                                    "Home",
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF10B981),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                AppText(
                                  "Primary address",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF0F172A),
                                ),
                                const SizedBox(height: 4),
                                AppText(
                                  "123 Lorem Lane Unit 4B, Apt 123\nSampletown",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF64748B),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.more_vert, color: Color(0xFF64748B), size: 20),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Add Another Address Button
                    GestureDetector(
                      onTap: () {
                        _showAddAddressBottomSheet(context);
                      },
                      child: DottedBorder(
                        color: const Color(0xFFE2E8F0),
                        strokeWidth: 1.5,
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(8),
                        dashPattern: const [6, 4],
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.add_circle_outline, color: AppColors.mainAppColor, size: 20),
                              const SizedBox(width: 8),
                              AppText(
                                "Add Another address",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.mainAppColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Save & Continue Button
                    CustomAppButton(
                      text: "Save & Continue",
                      onTap: () {
                        Get.offAllNamed(AppRoutes.bottomNavScreen);
                      }
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
              SvgPicture.asset(
                iconPath,
                width: 16,
                height: 16,
                colorFilter: ColorFilter.mode(
                  isSelected ? const Color(0xFF10B981) : const Color(0xFF64748B),
                  BlendMode.srcIn,
                ),
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
