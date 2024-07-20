import 'package:flutter/material.dart';
import 'package:plants_informations/core/utils/app_strings.dart';
import 'package:plants_informations/core/utils/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToHome();
    super.initState();
  }

  goToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/image/plant.png'),
              Text(
                AppStrings.splashAppName,
                style: AppTextStyles.title30GreenTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
