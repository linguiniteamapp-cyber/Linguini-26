import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart'; 
import 'package:linguini_app/welcome/wepage1.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1b4a58),
      body: Center(
        child: Image.asset(
          'images/LinguiniW.png',
          width: 280,
          
        ),
      ),
    );
  }
}
