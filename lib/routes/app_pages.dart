import 'package:cas_business_solutions/features/auth/forgot_password/change_password_screen.dart';
import 'package:cas_business_solutions/features/auth/forgot_password/forgot_password_screen.dart';
import 'package:cas_business_solutions/features/auth/log_in_screen.dart';
import 'package:cas_business_solutions/features/auth/forgot_password/password_reset_otp_screen.dart';
import 'package:cas_business_solutions/features/auth/registration/account_confirmation_screen.dart';
import 'package:cas_business_solutions/features/auth/registration/registration_screen.dart';
import 'package:cas_business_solutions/features/auth/registration/verify_account_screen.dart';
import 'package:cas_business_solutions/features/root_screen/root_screen.dart';
import 'package:cas_business_solutions/features/splash_screen.dart';
import 'package:cas_business_solutions/routes/app_routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static String get initial => AppRoutes.splashRoute;

  static final pages = <GetPage>[
    // Splash Screen
    GetPage(
      name: AppRoutes.splashRoute,
      page: () => const SplashScreen(),
      transitionDuration: const Duration(milliseconds: 500),
      // curve: Curves.easeOut,
      // transition: Transition.fadeIn,
    ),

    // Login Screen
    GetPage(
      name: AppRoutes.loginRoute,
      page: () => const LoginScreen(),
      transitionDuration: const Duration(milliseconds: 500),
      // curve: Curves.easeOut,
      // transition: Transition.fadeIn,
    ),

    // Registration Screen
    GetPage(
      name: AppRoutes.registrationRoute,
      page: () => const RegistrationScreen(),
      transitionDuration: const Duration(milliseconds: 500),
    ),

    // Verify Account Screen
    GetPage(
      name: AppRoutes.verifyAccountRoute,
      page: () => const VerifyAccountScreen(),
      transitionDuration: const Duration(milliseconds: 500),
    ),

    // Account Confirmation Screen
    GetPage(
      name: AppRoutes.accountConfirmationRoute,
      page: () => const AccountConfirmationScreen(),
      transitionDuration: const Duration(milliseconds: 500),
    ),

    // Forgot Password Screen
    GetPage(
      name: AppRoutes.forgotPasswordRoute,
      page: () => const ForgotPasswordScreen(),
      transitionDuration: const Duration(milliseconds: 500),
    ),

    // Password Reset OTP Screen
    GetPage(
      name: AppRoutes.passwordResetOtpRoute,
      page: () => const PasswordResetOtpScreen(),
      transitionDuration: const Duration(milliseconds: 500),
    ),

    // Change Password Screen
    GetPage(
      name: AppRoutes.changePasswordRoute,
      page: () => const ChangePasswordScreen(),
      transitionDuration: const Duration(milliseconds: 500),
    ),

    // Root Screen
    GetPage(
      name: AppRoutes.rootRoute,
      page: () => const RootScreen(),
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}
