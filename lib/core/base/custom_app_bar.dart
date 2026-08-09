import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackTap;
  final bool showBackButton;
  final bool isTransparent;
  final Widget? actionWidget;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBackTap,
    this.showBackButton = true,
    this.isTransparent = false,
    this.actionWidget,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height * 0.13;
    return Container(
      width: double.infinity,
      height: isTransparent ? null : size,
      padding: isTransparent ? EdgeInsets.only(top: MediaQuery.of(context).padding.top) : null,
      decoration: BoxDecoration(
        color: isTransparent ? Colors.transparent : AppColors.mainAppColor,
        borderRadius: isTransparent ? null : BorderRadius.only(
          bottomLeft: Radius.circular(32.r),
          bottomRight: Radius.circular(32.r),
        ),
      ),
      child: SafeArea(
        bottom: false,
        top: !isTransparent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: isTransparent ? 12.h : 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Conditionally show back button
              showBackButton
                  ? InkWell(
                      onTap: onBackTap ?? () => Get.back(),
                      borderRadius: BorderRadius.circular(12),
                      child: isTransparent 
                        ? Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                )
                              ]
                            ),
                            child: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF0F172A), size: 18),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(12),
                            child: SvgPicture.asset(
                              "assets/icons/backIcon.svg",
                              color: AppColors.white,
                            ),
                          ),
                    )
                  : const SizedBox(width: 48),

              // Title in center
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'SfPro-Regular',
                    fontSize: 20.sp,
                    color: isTransparent ? const Color(0xFF0F172A) : AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // Spacer for balance or action widget
              actionWidget ?? const SizedBox(width: 48),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height *
        0.15,
  );
}

