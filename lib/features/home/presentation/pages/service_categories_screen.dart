import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/base/appText.dart';
import '../../../../core/base/custom_app_bar.dart';
import '../../../../core/route/route.dart';
import '../../../../core/utils/app_colors.dart';

class ServiceCategoriesScreen extends StatefulWidget {
  const ServiceCategoriesScreen({super.key});

  @override
  State<ServiceCategoriesScreen> createState() => _ServiceCategoriesScreenState();
}

class _ServiceCategoriesScreenState extends State<ServiceCategoriesScreen> {
  int _selectedCategoryIndex = 0;

  final categories = [
    {"icon": Icons.home_repair_service_outlined, "title": "Install"},
    {"icon": Icons.house_outlined, "title": "Indoors"},
    {"icon": Icons.build_outlined, "title": "Repair"},
    {"icon": Icons.deck_outlined, "title": "Outdoors"},
    {"icon": Icons.cleaning_services_outlined, "title": "Cleaning"},
    {"icon": Icons.search, "title": "Search"},
  ];

  final subcategories = [
    {"icon": Icons.kitchen, "title": "Appliance\ninstall"},
    {"icon": Icons.electrical_services, "title": "Electrical"},
    {"icon": Icons.handyman, "title": "Handyman"},
    {"icon": Icons.vpn_key, "title": "Locksmith"},
    {"icon": Icons.local_fire_department, "title": "Gas Service"},
    {"icon": Icons.tv, "title": "TV moving"},
    {"icon": Icons.thermostat, "title": "Heating &\nCooling"},
    {"icon": Icons.roofing, "title": "Roofing"},
    {"icon": Icons.cleaning_services, "title": "Window\nCleaning"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: "Service Categories",
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
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 16),
                _buildMainCategories(),
                const SizedBox(height: 24),
                Expanded(
                  child: _buildSubCategories(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(categories.length, (index) {
          final cat = categories[index];
          final isSelected = _selectedCategoryIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategoryIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.mainAppColor : const Color(0xFFCCFBF1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      cat["icon"] as IconData,
                      color: isSelected ? Colors.white : const Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 8),
                  AppText(
                    cat["title"] as String,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF0F172A),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSubCategories() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.9,
      ),
      itemCount: subcategories.length,
      itemBuilder: (context, index) {
        final subcat = subcategories[index];
        return GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.serviceDetailsScreen);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE2E8F0), width: 0.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06), // Increased opacity for better visibility
                  blurRadius: 16,
                  spreadRadius: 2,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  subcat["icon"] as IconData,
                  color: const Color(0xFF0F172A),
                  size: 28,
                ),
                const SizedBox(height: 12),
                AppText(
                  subcat["title"] as String,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF0F172A),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
