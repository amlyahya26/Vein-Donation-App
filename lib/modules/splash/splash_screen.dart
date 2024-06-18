import 'package:donation_app/modules/onboarding/onboarding_screen.dart';
import 'package:donation_app/shared/components/components.dart';
import 'package:donation_app/shared/components/images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 3),
            () {
          navigateAndFinish(context, OnBoardingScreen());
        }
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset(Images.logo2)),
    );
  }
}