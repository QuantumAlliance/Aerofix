import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/base/appText.dart';
import '../../../../core/base/custom_app_bar.dart';
import '../../../../core/base/custom_text_field.dart';
import '../../../../core/route/route.dart';
import '../widgets/listed_job_card.dart';
import '../widgets/offer_card.dart';


class MyJobScreen extends StatefulWidget {
  const MyJobScreen({super.key});

  @override
  State<MyJobScreen> createState() => _MyJobScreenState();
}

class _MyJobScreenState extends State<MyJobScreen> {
  int _selectedTab = 0;

  // Expansion tile states
  bool _isDraftedExpanded = true;
  bool _isActiveExpanded = true;
  bool _isCompletedExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: "My Job",
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
          
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 16),
                _buildCustomTabBar(),
                const SizedBox(height: 16),
                _buildSearchBar(),
                const SizedBox(height: 24),
                
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _selectedTab == 0 
                      ? _buildListedJobsView() 
                      : _buildOffersView(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListedJobsView() {
    return Column(
      children: [
        _buildExpandableSection(
          title: "Drafted Job Pending (3)",
          isExpanded: _isDraftedExpanded,
          onToggle: () {
            setState(() {
              _isDraftedExpanded = !_isDraftedExpanded;
            });
          },
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: 3,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return const ListedJobCard(
                name: "Liam Carter",
                status: "Pending",
                statusColor: Color(0xFFF59E0B),
                statusBgColor: Color(0xFFFEF3C7),
                role: "Professional Repair Man",
                date: "21 May 2026 (Aft) • 10:00 Am",
                jobTitle: "Appliance install",
                description: "I need a new appliance installed and connected properly in my home. Please i...",
              );
            },
          ),
        ),
        
        _buildExpandableSection(
          title: "Active (2)",
          isExpanded: _isActiveExpanded,
          onToggle: () {
            setState(() {
              _isActiveExpanded = !_isActiveExpanded;
            });
          },
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: 2,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return const ListedJobCard(
                name: "Liam Carter",
                status: "Arrived",
                statusColor: Color(0xFF8B5CF6),
                statusBgColor: Color(0xFFEDE9FE),
                role: "Professional Repair Man",
                date: "21 May 2026 (Aft) • 10:00 Am",
                jobTitle: "Appliance install",
                description: "I need a new appliance installed and connected properly in my home. Please i...",
              );
            },
          ),
        ),
        
        _buildExpandableSection(
          title: "Completed (2)",
          isExpanded: _isCompletedExpanded,
          onToggle: () {
            setState(() {
              _isCompletedExpanded = !_isCompletedExpanded;
            });
          },
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: 2,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return const ListedJobCard(
                name: "Liam Carter",
                status: "Completed",
                statusColor: Color(0xFF10B981), // Green
                statusBgColor: Color(0xFFD1FAE5), // Light green
                role: "Professional Repair Man",
                date: "21 May 2026 (Aft) • 10:00 Am",
                jobTitle: "Appliance install",
                description: "I need a new appliance installed and connected properly in my home. Please i...",
              );
            },
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildOffersView() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 5,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return OfferCard(
          profileImage: "https://i.pravatar.cc/150?img=${index + 11}", 
          name: "Liam Carter",
          role: "Electrician",
          rating: 4.8,
          experience: "8 Years of experience",
          availabilityTitle: "Available Today",
          availabilityTime: "2:00 PM-4:00 PM",
          priceEstimate: "\$120-\$150",
          jobsCompleted: "123",
          onViewProfile: () {
            Get.toNamed(AppRoutes.technicianProfileScreen);
          },
          onHireTechnician: () {},
        );
      },
    );
  }

  Widget _buildCustomTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedTab = 0;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: _selectedTab == 0 ? const Color(0xFFCCFBF1) : Colors.transparent, // Light green
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: AppText(
                      "listed Job",
                      fontSize: 14,
                      fontWeight: _selectedTab == 0 ? FontWeight.w600 : FontWeight.w500,
                      color: _selectedTab == 0 ? const Color(0xFF0F172A) : const Color(0xFF64748B),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedTab = 1;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: _selectedTab == 1 ? const Color(0xFFCCFBF1) : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: AppText(
                      "Offers",
                      fontSize: 14,
                      fontWeight: _selectedTab == 1 ? FontWeight.w600 : FontWeight.w500,
                      color: _selectedTab == 1 ? const Color(0xFF0F172A) : const Color(0xFF64748B),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomTextField(
        hintText: "Search Here...",
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.search, color: Color(0xFF64748B)),
        suffixIcon: const Icon(Icons.search, color: Color(0xFF64748B)),
        textEditingController: TextEditingController(),
      ),
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required bool isExpanded,
    required VoidCallback onToggle,
    required Widget child,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onToggle,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  title,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF0F172A),
                ),
                Icon(
                  isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: const Color(0xFF0F172A),
                  size: 24,
                ),
              ],
            ),
          ),
        ),
        if (isExpanded) ...[
          const SizedBox(height: 12),
          child,
          const SizedBox(height: 24),
        ] else ...[
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}
