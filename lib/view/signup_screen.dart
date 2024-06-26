import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:machine_test_wincept/utils/colors.dart';
import 'package:machine_test_wincept/view/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: fifthColor,
      body: Scaffold(
        backgroundColor: fifthColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.06,
              ),
              SizedBox(
                height: size.height * 0.5,
                child: Lottie.asset('asset/lottie/coffee three.json'),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Please Signup",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      focusColor: Colors.white,
                      filled: true,
                      hintText: "email",
                      hintStyle:
                          const TextStyle(color: Colors.grey, letterSpacing: 1),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)),
                      fillColor: Colors.white,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Icon(
                          Icons.mail_outline_rounded,
                          size: 25,
                        ),
                      ),
                      prefixStyle: const TextStyle(color: secondaryColor)),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      focusColor: Colors.white,
                      filled: true,
                      hintText: "password",
                      hintStyle:
                          const TextStyle(color: Colors.grey, letterSpacing: 1),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)),
                      fillColor: Colors.white,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Icon(
                          Icons.mail_outline_rounded,
                          size: 25,
                        ),
                      ),
                      prefixStyle: const TextStyle(color: secondaryColor)),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: size.width,
                    height: size.height * 0.08,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "Signup",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              RichText(
                text: TextSpan(
                  text: 'Already a user? ',
                  style: const TextStyle(color: primaryColor),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Login!',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ));
                          }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
