import 'package:flutter/material.dart';
import 'package:cuttingedge/features/splash/view/splash_screen.dart';
import 'package:cuttingedge/features/auth/view/login_screen.dart';
import 'package:cuttingedge/features/auth/view/onboarding_screen.dart';
import 'package:cuttingedge/features/auth/view/signup_screen.dart';
import 'package:cuttingedge/features/home/view/home_screen.dart';
import 'package:cuttingedge/features/history/view/history_screen.dart';
import 'package:cuttingedge/features/profile/view/profile_screen.dart';
import 'package:cuttingedge/features/profile/view/edit_profile_screen.dart';
import 'package:cuttingedge/features/customer/auth/view/customer_login_screen.dart';
import 'package:cuttingedge/features/customer/auth/view/customer_signup_screen.dart';
import 'package:cuttingedge/features/customer/home/view/customer_home_screen.dart';

class Routes {
  /// ✅ **Define Route Names**
  static const String initial = '/';
  static const String welcome = '/welcome';
  static const String login = '/subscription';
  static const String customerLogin = '/customer_login';
  static const String customerSignup = '/customer_signup';
  static const String customerHome = '/customer_home'; // Added customer home route
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String otpVerification = '/otp-verification';
  static const String newPasswordScreen = '/new-password';
  static const String home = '/home';
  static const String securitySettings = '/security-settings';
  static const String favorites = '/favorites';
  static const String bookings = '/bookings';
  static const String profile = '/profile';
  static const String editProfile = '/edit-profile';
  static const String chat = '/messages';
  static const String generatedVouchers = '/generated-vouchers';

  /// ✅ **Define Named Routes**
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      initial: (context) => SplashScreen(),
      welcome: (context) => OnboardingScreen(),
      login: (context) => LoginScreen(),
      customerLogin: (context) => CustomerLoginScreen(),
      customerSignup: (context) => CustomerSignupScreen(),
      customerHome: (context) => CustomerHomeScreen(), // Added customer home route
      signup: (context) => SignUpScreen(),
      home: (context) => HomeScreen(),
      bookings: (context) => WorkHistoryScreen(),
      profile: (context) => ProfileScreen(),
      editProfile: (context) => EditProfileScreen(),
    };
  }

  /// ✅ **Dynamic Navigation Handling**
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    print("🔹 Navigating to: ${settings.name}");

    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.welcome:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.customerLogin:
        return MaterialPageRoute(builder: (_) => CustomerLoginScreen());
      case Routes.customerSignup:
        return MaterialPageRoute(builder: (_) => CustomerSignupScreen());
      case Routes.customerHome: // Added customer home case
        return MaterialPageRoute(builder: (_) => CustomerHomeScreen());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.securitySettings:
      case Routes.favorites:
      case Routes.bookings:
        return MaterialPageRoute(builder: (_) => WorkHistoryScreen());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case Routes.editProfile:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());
      default:
        print("❌ ERROR: Undefined Route - ${settings.name}");
        return _errorRoute();
    }
  }

  /// ✅ **Handle Unknown Routes**
  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    print("⚠️ Unknown Route Attempted: ${settings.name}");
    return _errorRoute();
  }

  /// 🚀 **Reusable 404 Error Page**
  static MaterialPageRoute _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text(
            "🚫 404 - Page Not Found",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
      ),
    );
  }
}