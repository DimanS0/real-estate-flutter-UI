import 'package:flutter/material.dart';
import 'package:mseti1/presentation/screens/auth_screens/login_signup_screen.dart';
import 'package:mseti1/presentation/screens/auth_screens/sign_up_screen.dart';
import 'package:mseti1/presentation/screens/favorite/favorite_screen.dart';
import 'package:mseti1/presentation/screens/home/home_screen.dart';

import '../presentation/screens/splash/onboarding_screen.dart';
import '../presentation/screens/splash/splash_screen.dart';

class AppRoutes {
  // Initialize routes with the getRoutes method
  static final Map<String, WidgetBuilder> routes = getRoutes();

  // Define the routes
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      "/": (context) => const SplashScreen(),
      "/onboarding": (context) => const OnboardingScreen(),
      // Add other routes here
       '/home': (context) => const HomeScreen(),
       '/login': (context) => const LoginScreen(),
      '/signup' : (context)  =>   const SignUpScreen(),
      '/favorite': (context) =>   const FavoritesScreen(),

      // '/profile': (context) => const ProfileScreen(),
    };
  }
}

