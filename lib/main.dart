import 'package:flutter/material.dart';
import 'package:fashion/screens/splash_screen.dart';
import 'package:fashion/screens/onboarding_screen.dart';
import 'package:fashion/screens/registration.dart';
import 'package:fashion/screens/login.dart';
import 'package:fashion/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(), // Splash screen as the first screen
        '/onboarding': (context) => const OnboardingScreen(),
        '/registration': (context) => const Registration(),
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
      },
    );
  }
}
