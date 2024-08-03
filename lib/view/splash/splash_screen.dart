import 'package:flutter/material.dart';
import 'package:food_subs/utils/lottie_files.dart';
import 'package:food_subs/view/auth/login_screen.dart';
import 'package:food_subs/view/landing/landing_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  final String? userId;
  const SplashScreen({super.key, this.userId});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(const Duration(milliseconds: 8000), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              widget.userId != null ? const LandingScreen() : LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          LottieFiles.splash,
          width: 200,
          height: 200,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
