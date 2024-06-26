import 'package:flutter/material.dart';
import 'package:machine_test_wincept/utils/colors.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SizedBox(
        width: size.width,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.04,
            ),
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('asset/profile_image.webp'),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const Text(
              'John',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0.5, 0.5),
                          blurRadius: 1,
                          spreadRadius: 0,
                          color: Colors.grey.shade400)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              height: size.height * 0.07,
                              child: const Icon(Icons.person)),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Profile",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: primaryColor),
                          ),
                        ],
                      ),
                      const Icon(Icons.arrow_forward_ios_outlined)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0.5, 0.5),
                          blurRadius: 1,
                          spreadRadius: 0,
                          color: Colors.grey.shade400)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              height: size.height * 0.07,
                              child: const Icon(Icons.file_copy_rounded)),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Terms and Conditions",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: primaryColor),
                          ),
                        ],
                      ),
                      const Icon(Icons.arrow_forward_ios_outlined)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0.5, 0.5),
                          blurRadius: 1,
                          spreadRadius: 0,
                          color: Colors.grey.shade400)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              height: size.height * 0.07,
                              child: const Icon(Icons.privacy_tip_rounded)),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Privacy Policy",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: primaryColor),
                          ),
                        ],
                      ),
                      const Icon(Icons.arrow_forward_ios_outlined)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: fifthColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0.5, 0.5),
                          blurRadius: 1,
                          spreadRadius: 0,
                          color: Colors.grey.shade400)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              height: size.height * 0.07,
                              child: const Icon(Icons.power_settings_new)),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Log Out ",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: primaryColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
