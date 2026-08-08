import 'package:aerofix/features/auth/otp_screen.dart';
import 'package:aerofix/features/auth/sign_up_screen.dart';
import 'package:get/get.dart';
import '../../features/auth/login_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/splash/welcom_screen.dart';
import '../base/bottom_nav/bottom_nav.dart';


class AppRoutes {


  static const String bottomNavScreen = "/bottom_nav";
  static const String splashScreen = "/splash_screen";
  static const String welcomScreen = "/welcom_screen";
  static const String loginScreen = "/login_screen";
  static const String signUpScreen = "/sign_up_screen";
  static const String otpScreen = "/otp_screen";

  static List<GetPage> routes = [

    GetPage(name: bottomNavScreen, page: () => BottomNavScreen()),
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: welcomScreen, page: () => WelcomeScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: otpScreen, page: () => OtpScreen()),

  ];
}