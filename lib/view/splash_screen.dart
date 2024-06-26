import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:machine_test_wincept/utils/colors.dart';
import 'package:machine_test_wincept/view/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FlutterSplashScreen.scale(
        backgroundColor: fifthColor,
        childWidget: SizedBox(
          height: size.height * 0.4,
          child: LottieBuilder.asset(
            'asset/lottie/coffee two.json',
            fit: BoxFit.cover,
          ),
        ),
        duration: const Duration(milliseconds: 3000),
        animationDuration: const Duration(milliseconds: 3000),
        onAnimationEnd: () => debugPrint("On Scale End"),
        nextScreen: const LoginScreen(),
      ),
    );
  }
}
