import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import '../../../../core/base/appText.dart';
import '../../../../core/base/custom_app_bar.dart';
import '../../../../core/base/custom_app_button.dart';
import '../../../../core/base/custom_text_field.dart';
import '../../../../core/utils/app_colors.dart';

class AddressDetailsScreen extends StatefulWidget {
  const AddressDetailsScreen({super.key});

  @override
  State<AddressDetailsScreen> createState() => _AddressDetailsScreenState();
}

class _AddressDetailsScreenState extends State<AddressDetailsScreen> {
  final _controller = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: "Address Details",
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
                    
                    // Allow Lawn Signs
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Color(0xFFE2E8F0))),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            "Allow Lawn Signs",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF0F172A),
                          ),
                          AdvancedSwitch(
                            controller: _controller,
                            activeColor: AppColors.mainAppColor,
                            inactiveColor: const Color(0xFFE2E8F0),
                            width: 44,
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Primary Address
                    AppText(
                      "Primary Address",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF0F172A),
                    ),
                    const SizedBox(height: 16),
                    
                    // Address Card
                    Container(
                      padding: const EdgeInsets.all(16),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.location_on, color: Color(0xFF0F172A), size: 24),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  "Home",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF0F172A),
                                ),
                                const SizedBox(height: 4),
                                AppText(
                                  "123 Lorem Street, Unit 4B Sample City, ON\nA1A 1A1",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF64748B),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.check, color: Color(0xFF0F172A), size: 20),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Add Address Button
                    InkWell(
                      onTap: () {
                        _showAddAddressBottomSheet(context);
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.add, color: Color(0xFF0F172A), size: 20),
                            const SizedBox(width: 8),
                            AppText(
                              "Add a new address",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF0F172A),
                            ),
                          ],
                        ),
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

  Widget _buildAddressTypeButton(
    String title,
    String iconPath,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.mainAppColor : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? AppColors.mainAppColor : const Color(0xFFE2E8F0),
            ),
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                iconPath,
                colorFilter: ColorFilter.mode(
                  isSelected ? Colors.white : const Color(0xFF64748B),
                  BlendMode.srcIn,
                ),
                height: 24,
              ),
              const SizedBox(height: 8),
              AppText(
                title,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : const Color(0xFF0F172A),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
