import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import '../../../../core/base/appText.dart';
import '../../../../core/base/custom_app_bar.dart';
import '../../../../core/base/custom_app_button.dart';
import '../../../../core/utils/app_colors.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  String _selectedFlag = "🇬🇧";
  String _selectedPhoneCode = "+44";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: "Help & Support",
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
                  children: [
                    const SizedBox(height: 20),
                    
                    _buildTextField("Enter your full name"),
                    const SizedBox(height: 16),
                    
                    _buildTextField("E-mail address registered at Swiftrides"),
                    const SizedBox(height: 16),
                    
                    // Phone Number Field
                    Row(
                      children: [
                        // Country Code Picker
                        GestureDetector(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              showPhoneCode: true,
                              countryListTheme: CountryListThemeData(
                                bottomSheetHeight: MediaQuery.of(context).size.height * 0.6,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24),
                                ),
                              ),
                              onSelect: (Country country) {
                                setState(() {
                                  _selectedFlag = country.flagEmoji;
                                  _selectedPhoneCode = "+${country.phoneCode}";
                                });
                              },
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: const Color(0xFFE2E8F0)),
                            ),
                            child: Row(
                              children: [
                                AppText(
                                  "$_selectedFlag $_selectedPhoneCode",
                                  fontSize: 16,
                                ),
                                const SizedBox(width: 4),
                                const Icon(Icons.arrow_drop_down, color: Color(0xFF0F172A), size: 20),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Phone Number Input
                        Expanded(
                          child: _buildTextField("enter phone number"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Multi-line text field
                    Stack(
                      children: [
                        TextFormField(
                          maxLines: 5,
                          style: const TextStyle(
                            fontFamily: 'SfPro-Regular',
                            fontSize: 14,
                            color: Color(0xFF0F172A),
                          ),
                          decoration: InputDecoration(
                            hintText: "e.g. My app is not workin...",
                            hintStyle: const TextStyle(
                              fontFamily: 'SfPro-Regular',
                              fontSize: 14,
                              color: Color(0xFF94A3B8),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.all(16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: AppColors.mainAppColor),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 12,
                          right: 12,
                          child: Row(
                            children: [
                              const Icon(Icons.attach_file, size: 16, color: Color(0xFF64748B)),
                              const SizedBox(width: 4),
                              AppText(
                                "2/10",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF64748B),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    CustomAppButton(
                      text: "SUBMIT",
                      onTap: () {},
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

  Widget _buildTextField(String hint) {
    return TextFormField(
      style: const TextStyle(
        fontFamily: 'SfPro-Regular',
        fontSize: 14,
        color: Color(0xFF0F172A),
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          fontFamily: 'SfPro-Regular',
          fontSize: 14,
          color: Color(0xFF94A3B8),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.mainAppColor),
        ),
      ),
    );
  }
}
