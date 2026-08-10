import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/base/appText.dart';
import '../../../../core/base/custom_text_field.dart';
import '../../../../core/route/route.dart';
import '../../../../core/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  _buildTopBar(),
                  const SizedBox(height: 24),
                  _buildSearchBar(),
                  const SizedBox(height: 24),
                  _buildBanner(),
                  const SizedBox(height: 24),
                  _buildCategories(),
                  const SizedBox(height: 32),
                  _buildPopularServices(),
                  const SizedBox(height: 32),
                  _buildPopularSummerServices(),
                  const SizedBox(height: 32),
                  _buildSpecialOffers(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              image: const DecorationImage(
                image: NetworkImage("https://i.pravatar.cc/300?img=5"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          
          // Location Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  "Alex Carter",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF0F172A),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Color(0xFF0F172A)),
                    const SizedBox(width: 4),
                    AppText(
                      "23/B Kumapara, Sylhet",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF64748B),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Notification Bell
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.notificationsScreen);
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
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
                  child: const Icon(Icons.notifications_none_outlined, color: Color(0xFF0F172A)),
                ),
                Positioned(
                  top: -4,
                  right: -4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEF4444),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: AppText(
                      "06",
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              hintText: "Search Here...",
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.search, color: Color(0xFF64748B)),
              textEditingController: TextEditingController(),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFCCFBF1), // Light green background
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.tune, color: AppColors.mainAppColor),
          ),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              _buildBannerCard(),
              _buildBannerCard(),
              _buildBannerCard(),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Dots indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            bool isActive = _currentPage == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: isActive ? 24 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.mainAppColor,
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildBannerCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF34D399),
            Color(0xFF10B981),
          ],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: AppText(
                    "Popular",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 12),
                AppText(
                  "Hire a Service Man",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                AppText(
                  "Need help with wiring, repair, or\ninstallation?",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.9),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xFFA7F3D0).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: AppText(
                    "Book Now",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF065F46),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    final categories = [
      {"icon": Icons.home_repair_service_outlined, "title": "Install"},
      {"icon": Icons.house_outlined, "title": "Indoors"},
      {"icon": Icons.build_outlined, "title": "Repair"},
      {"icon": Icons.deck_outlined, "title": "Outdoors"},
      {"icon": Icons.cleaning_services_outlined, "title": "Cleaning"},
      {"icon": Icons.deck_outlined, "title": "Outdoors"},
      {"icon": Icons.cleaning_services_outlined, "title": "Cleaning"},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: categories.map((cat) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.serviceCategoriesScreen);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: const BoxDecoration(
                      color: Color(0xFFCCFBF1), // Light teal background
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      cat["icon"] as IconData,
                      color: const Color(0xFF0F172A),
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
        }).toList(),
      ),
    );
  }

  Widget _buildPopularServices() {
    final services = [
      {"title": "House Cleaning", "img": "https://cdn.prod.website-files.com/6536c51e73c8501f964d9300/65ccc5a4e5614c70ad3869a9_carole%27s-house-cleaning-team-2-p-500.jpg"},
      {"title": "Handyman", "img": "https://www.cresswellservices.co.uk/wp-content/uploads/2024/12/iStock-1472823647-1-1024x651.jpg"},
      {"title": "Plumbing", "img": "https://pslmechanical.com/wp-content/uploads/2024/10/plumbing-residential.jpeg"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AppText(
            "Popular Services",
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: services.map((service) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.serviceDetailsScreen);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          service["img"]!,
                          width: 140,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 12),
                      AppText(
                        service["title"]!,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF0F172A),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildPopularSummerServices() {
    final services = [
      {"title": "Pressure Washing", "img": "https://business.yelp.com/wp-content/uploads/2023/07/Pacific-Beach-Pressure-Washing-on-Yelp-cropped-1024x517.webp"},
      {"title": "Window Cleaning", "img": "https://winducks.com/wp-content/uploads/2023/10/5-advantages-of-professional-window-cleaning.jpg"},
      {"title": "Lawn Care", "img": "https://dlczb9lfz9r73.cloudfront.net/wp-content/uploads/2024/05/02130509/AdobeStock_576366382-e1747919227776.jpeg.webp"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AppText(
            "Popular summer services",
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: services.map((service) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        service["img"]!,
                        width: 140,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 12),
                    AppText(
                      service["title"]!,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF0F172A),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildSpecialOffers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AppText(
            "Special offers",
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              _buildOfferCard(),
              const SizedBox(width: 16),
              _buildOfferCard(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOfferCard() {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFD1FAE5),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          // Placeholder for the gift box image
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            alignment: Alignment.center,
            child: AppText(
              "Schedule &\nSave",
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.mainAppColor,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(
                fontFamily: 'SfPro-Regular',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF0F172A),
              ),
              children: [
                TextSpan(text: "Schedule a reminder and\n"),
                TextSpan(
                  text: "save 15% on repeat jobs.",
                  style: TextStyle(color: AppColors.mainAppColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.mainAppColor.withOpacity(0.3)),
            ),
            child: AppText(
              "Learn More",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.mainAppColor,
            ),
          ),
        ],
      ),
    );
  }
}
