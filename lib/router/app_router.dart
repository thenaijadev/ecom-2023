import 'package:ecommerce_application/presentation/screens/cart_screen.dart';
import 'package:ecommerce_application/presentation/screens/error_screen.dart';
import 'package:ecommerce_application/presentation/screens/buttom_nav_bar.dart';
import 'package:ecommerce_application/presentation/screens/otp_verification.dart';
import 'package:ecommerce_application/presentation/screens/recover_password.dart';
import 'package:ecommerce_application/presentation/screens/registration_screen.dart';
import 'package:ecommerce_application/presentation/screens/login_screen.dart';
import 'package:ecommerce_application/presentation/screens/welcome_screen.dart';

import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );
      case "/cart":
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
        );
      case "/register":
        return MaterialPageRoute(
          builder: (_) => const RegistrationScreen(),
        );
      case "/login":
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case "/passwordrecovery":
        return MaterialPageRoute(
          builder: (_) => const PasswordRecoveryScreen(),
        );
      case "/otpverification":
        return MaterialPageRoute(
          builder: (_) => const OTPVerificationScreen(),
        );

      case "/home":
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
