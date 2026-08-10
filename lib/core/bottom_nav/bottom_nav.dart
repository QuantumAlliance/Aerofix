import 'package:aerofix/features/home/presentation/pages/home_screen.dart';
import 'package:aerofix/features/inbox/presentation/pages/chat_screen.dart';
import 'package:aerofix/features/my_job/presentation/pages/my_job_screen.dart';
import 'package:aerofix/features/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/app_icons.dart';



class BottomNavScreen extends StatefulWidget {
  final int initialIndex;
  const BottomNavScreen({super.key, this.initialIndex = 0});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  void navigationItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomeScreen(),
    MyJobScreen(),
    ChatScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _pages[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE7F4F6),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
          border: const Border(
            top: BorderSide(color: Color(0xFFE3E6F0), width: 1),
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.12,
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          selectedItemColor: AppColors.mainAppColor,
          unselectedItemColor: AppColors.foundationColor,
          selectedLabelStyle: const TextStyle(
            fontFamily: 'SfPro-Bold',
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'SfPro-Bold',
            fontWeight: FontWeight.w600,
            fontSize: 11,
          ),
          showSelectedLabels: true,
          backgroundColor: Colors.transparent,
          onTap: navigationItemTap,
          items: [
            _navItem(AppIcons.homeU,  AppIcons.homeS, "Home".tr, 0),
            _navItem(AppIcons.myjobU,        AppIcons.inboxIconS,  "My Job".tr,  1),
            _navItem(AppIcons.inboxIconU,     AppIcons.inboxIconS, "Chat".tr, 2),
            _navItem(AppIcons.profileIconU,      AppIcons.profileIconS,  "Profile".tr,  3),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _navItem(
      String unselected,
      String selected,
      String label,
      int index,
      ) {
    final bool isSelected = selectedIndex == index;

    return BottomNavigationBarItem(
      label: label,
      icon: SvgPicture.asset(
        unselected,
        height: 22,
        width: 22,
        colorFilter: const ColorFilter.mode(
          AppColors.foundationColor,
          BlendMode.srcIn,
        ),
      ),
      activeIcon: SvgPicture.asset(
        selected,
        height: 23,
        width: 23,
        colorFilter:const  ColorFilter.mode(
          AppColors.mainAppColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}