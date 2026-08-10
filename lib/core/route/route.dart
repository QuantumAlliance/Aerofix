import 'package:aerofix/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:aerofix/features/auth/presentation/pages/set_up_profile_screen.dart';
import 'package:aerofix/features/auth/presentation/pages/forgot_password_screen.dart';
import 'package:aerofix/features/auth/presentation/pages/new_password_screen.dart';
import 'package:aerofix/features/home/presentation/pages/home_screen.dart';
import 'package:aerofix/features/my_job/presentation/pages/my_job_screen.dart';
import 'package:aerofix/features/inbox/presentation/pages/chat_screen.dart';
import 'package:aerofix/features/profile/presentation/pages/profile_screen.dart';
import 'package:aerofix/features/profile/presentation/pages/personal_information_screen.dart';
import 'package:aerofix/features/profile/presentation/pages/address_details_screen.dart';
import 'package:aerofix/features/profile/presentation/pages/notifications_screen.dart';
import 'package:aerofix/features/profile/presentation/pages/notification_settings_screen.dart';
import 'package:aerofix/features/my_job/presentation/pages/technician_profile_screen.dart';
import 'package:aerofix/features/my_job/presentation/pages/technician_reviews_screen.dart';
import 'package:aerofix/features/my_job/presentation/pages/confirm_technician_screen.dart';
import 'package:aerofix/features/profile/presentation/pages/payment_details_screen.dart';
import 'package:aerofix/features/profile/presentation/pages/security_screen.dart';
import 'package:aerofix/features/profile/presentation/pages/help_support_screen.dart';
import 'package:aerofix/features/profile/presentation/pages/privacy_policy_screen.dart';
import 'package:aerofix/features/profile/presentation/pages/terms_of_service_screen.dart';
import 'package:get/get.dart';
import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/auth/presentation/pages/otp_screen.dart';
import '../../features/home/presentation/pages/confirm_job_details_screen.dart';
import '../../features/home/presentation/pages/service_categories_screen.dart';
import '../../features/home/presentation/pages/service_details_screen.dart';
import '../../features/home/presentation/pages/request_job_screen.dart';
import '../../features/inbox/presentation/pages/chat_details_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../../features/splash/presentation/welcom_screen.dart';
import '../bottom_nav/bottom_nav.dart';


class AppRoutes {


  static const String bottomNavScreen = "/bottom_nav";
  static const String splashScreen = "/splash_screen";
  static const String welcomScreen = "/welcom_screen";
  static const String loginScreen = "/login_screen";
  static const String signUpScreen = "/sign_up_screen";
  static const String otpScreen = "/otp_screen";
  static const String setUpProfileScreen = "/set_up_profile_screen";
  static const String forgotPasswordScreen = "/forgot_password_screen";
  static const String newPasswordScreen = "/new_password_screen";
  static const String homeScreen = "/home_screen";
  static const String myJobScreen = "/my_job_screen";
  static const String chatScreen = "/chat_screen";
  static const String profileScreen = "/profile_screen";
  static const String personalInfoScreen = "/personal_info_screen";
  static const String addressDetailsScreen = "/address_details_screen";
  static const String notificationsScreen = "/notifications_screen";
  static const String notificationSettingsScreen = "/notification_settings_screen";
  static const String paymentDetailsScreen = "/payment_details_screen";
  static const String securityScreen = "/security_screen";
  static const String helpSupportScreen = "/help_support_screen";
  static const String privacyPolicyScreen = "/privacy_policy_screen";
  static const String termsOfServiceScreen = "/terms_of_service_screen";
  static const String chatDetailsScreen = "/chat_details_screen";
  static const String serviceCategoriesScreen = "/service_categories_screen";
  static const String serviceDetailsScreen = "/service_details_screen";
  static const String confirmJobDetailsScreen = "/confirm_job_details_screen";
  static const String requestJobScreen = "/request_job_screen";
  static const String technicianProfileScreen = "/technician_profile_screen";
  static const String technicianReviewsScreen = "/technician_reviews_screen";
  static const String confirmTechnicianScreen = "/confirm_technician_screen";






  static List<GetPage> routes = [
    GetPage(name: bottomNavScreen, page: () => BottomNavScreen()),
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: welcomScreen, page: () => WelcomeScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: otpScreen, page: () => OtpScreen()),
    GetPage(name: setUpProfileScreen, page: () => SetUpProfileScreen()),
    GetPage(name: forgotPasswordScreen, page: () => ForgotPasswordScreen()),
    GetPage(name: newPasswordScreen, page: () => NewPasswordScreen()),
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: myJobScreen, page: () => const MyJobScreen()),
    GetPage(name: chatScreen, page: () => const ChatScreen()),
    GetPage(name: profileScreen, page: () => const ProfileScreen()),
    GetPage(name: personalInfoScreen, page: () => const PersonalInformationScreen()),
    GetPage(name: addressDetailsScreen, page: () => const AddressDetailsScreen()),
    GetPage(name: notificationsScreen, page: () => const NotificationsScreen()),
    GetPage(name: notificationSettingsScreen, page: () => const NotificationSettingsScreen()),
    GetPage(name: paymentDetailsScreen, page: () => const PaymentDetailsScreen()),
    GetPage(name: securityScreen, page: () => const SecurityScreen()),
    GetPage(name: helpSupportScreen, page: () => const HelpSupportScreen()),
    GetPage(name: privacyPolicyScreen, page: () => const PrivacyPolicyScreen()),
    GetPage(name: termsOfServiceScreen, page: () => const TermsOfServiceScreen()),
    GetPage(name: chatDetailsScreen, page: () => const ChatDetailsScreen()),
    GetPage(name: serviceCategoriesScreen, page: () => const ServiceCategoriesScreen()),
    GetPage(name: serviceDetailsScreen, page: () => const ServiceDetailsScreen()),
    GetPage(name: confirmJobDetailsScreen, page: () => const ConfirmJobDetailsScreen()),
    GetPage(name: requestJobScreen, page: () => const RequestJobScreen()),
    GetPage(name: technicianProfileScreen, page: () => const TechnicianProfileScreen()),
    GetPage(name: technicianReviewsScreen, page: () => const TechnicianReviewsScreen()),
    GetPage(name: confirmTechnicianScreen, page: () => const ConfirmTechnicianScreen()),
  ];
}