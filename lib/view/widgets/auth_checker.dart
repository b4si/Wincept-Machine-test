import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_wincept/firebase_options.dart';
import 'package:machine_test_wincept/view/bottom_nav_bar.dart';
import 'package:machine_test_wincept/view/splash_screen.dart';

class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: _checkAuthStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasData && snapshot.data != null) {
          return const BottomNavBarWidget();
        } else {
          return const SplashScreen();
        }
      },
    );
  }

  Future<User?> _checkAuthStatus() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return FirebaseAuth.instance.currentUser;
  }
}
