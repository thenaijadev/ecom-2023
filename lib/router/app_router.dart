import 'package:ecommerce_application/app/data/models/product_model.dart';
import 'package:ecommerce_application/app/presentation/screens/buttom_nav_bar.dart';
import 'package:ecommerce_application/app/presentation/screens/cart_screen.dart';
import 'package:ecommerce_application/app/presentation/screens/error_screen.dart';
import 'package:ecommerce_application/app/presentation/screens/login_screen.dart';
import 'package:ecommerce_application/app/presentation/screens/otp_verification.dart';
import 'package:ecommerce_application/app/presentation/screens/payment_screen.dart';
import 'package:ecommerce_application/app/presentation/screens/product_screen.dart';
import 'package:ecommerce_application/app/presentation/screens/recover_password.dart';
import 'package:ecommerce_application/app/presentation/screens/welcome_screen.dart';
import 'package:ecommerce_application/router/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.welcomeScreen:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );
      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
        );
      case Routes.productScreen:
        var data = routeSettings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (_) => ProductScreen(product: data),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case Routes.passwordRecoveryScreen:
        return MaterialPageRoute(
          builder: (_) => const PasswordRecoveryScreen(),
        );
      case Routes.otpVerifcationScreen:
        return MaterialPageRoute(
          builder: (_) => const OTPVerificationScreen(),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.paymentScreen:
        return MaterialPageRoute(
          builder: (_) => const PaymentChoiceScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
