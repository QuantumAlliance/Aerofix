import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../core/route/route.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Get.offAllNamed(AppRoutes.welcomScreen);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF10B981),
              Color(0xFF34D399),
              Color(0xFF6EE7B7),
              Color(0xFFA7F3D0),
              Color(0xFFD1FAE5),
              Color(0xFFECFDF5),
            ],
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            "assets/icons/image (1).svg",
          ),
        ),
      ),
    );
  }
}