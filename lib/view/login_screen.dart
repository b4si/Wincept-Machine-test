import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:machine_test_wincept/controller/auth_controller.dart';
import 'package:machine_test_wincept/utils/colors.dart';
import 'package:machine_test_wincept/view/signup_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: fifthColor,
      body: SingleChildScrollView(
        child: Consumer<AuthController>(
          builder: (context, value, child) => Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.06,
                ),
                SizedBox(
                  height: size.height * 0.5,
                  child: Lottie.asset('asset/lottie/Coffee.json'),
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
                        "Please Login",
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
                    controller: value.emailControllerForLogin,
                    decoration: InputDecoration(
                        focusColor: Colors.white,
                        filled: true,
                        hintText: "email",
                        hintStyle: const TextStyle(
                            color: Colors.grey, letterSpacing: 1),
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      final emailRegExp = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                      );
                      if (!emailRegExp.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.0),
                  child: TextFormField(
                    controller: value.passwordControllerForLogin,
                    decoration: InputDecoration(
                        focusColor: Colors.white,
                        filled: true,
                        hintText: "password",
                        hintStyle: const TextStyle(
                            color: Colors.grey, letterSpacing: 1),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        fillColor: Colors.white,
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Icon(
                            Icons.password_rounded,
                            size: 25,
                          ),
                        ),
                        prefixStyle: const TextStyle(color: secondaryColor)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please type the password';
                      } else if (value.length < 8) {
                        return 'Please type atleast 8 characters';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.0),
                  child: InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        value.login(context);
                      }
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const BottomNavBarWidget(),
                      //     ),
                      //     (route) => false);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: size.width,
                      height: size.height * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "Login",
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
                    text: 'Not a user? ',
                    style: const TextStyle(color: primaryColor),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Signup!',
                          style: const TextStyle(
                            color: Colors
                                .blue, // Change this to your desired color
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpScreen(),
                                  ));
                            }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    final provider = Provider.of<AuthController>(context, listen: false);
    provider.emailControllerForLogin.clear();
    provider.passwordControllerForLogin.clear();
    super.dispose();
  }
}
