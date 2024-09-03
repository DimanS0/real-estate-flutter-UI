import 'package:flutter/material.dart';
import 'package:mseti1/provider/favorite_provider.dart';
import 'package:mseti1/provider/sign_up_provider.dart';
import 'package:mseti1/provider/theme_provider.dart';
import 'package:mseti1/routes/app_routes.dart';
import 'package:mseti1/theme/theme_mode.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider<LoginSignUpProvider>(
          create: (_) => LoginSignUpProvider(),
        ),
        ChangeNotifierProvider<FavoritesProvider>(
          create: (_) => FavoritesProvider(),
        ),
        // Add other providers here if needed
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Theme Switcher App',
            theme: AppTheme.lightTheme, // Default light theme
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode, // Controls the theme
            initialRoute: '/', // Define the initial route
            routes: AppRoutes.routes, // Use the routes from AppRoutes
          );
        },
      ),
    );
  }
}
