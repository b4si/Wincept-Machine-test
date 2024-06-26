import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_wincept/utils/colors.dart';
import 'package:machine_test_wincept/view/widgets/main_container_widget.dart';
import 'package:machine_test_wincept/view/widgets/shimmer_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final productStream =
      FirebaseFirestore.instance.collection('Products').snapshots();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu_outlined),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage('asset/profile_image.webp'),
          ),
          SizedBox(
            width: 12,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Good morning John',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    filled: true,
                    hintText: "Search Coffee...",
                    hintStyle: const TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(60)),
                    fillColor: Colors.grey.shade200,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.search_sharp,
                        size: 25,
                      ),
                    ),
                    prefixStyle: const TextStyle(color: secondaryColor)),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: StreamBuilder(
                  stream: productStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Image.asset(
                          'asset/Network error.jpg',
                          height: size.height * 0.3,
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return GridView.builder(
                        itemCount: 5,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 0.65),
                        itemBuilder: (context, index) {
                          return const ShimmerContainer();
                        },
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.none) {
                      return const Center(
                        child: Text("No internet connection"),
                      );
                    } else {
                      var data = snapshot.data!.docs;
                      return GridView.builder(
                        padding: const EdgeInsets.only(bottom: 14),
                        itemCount: data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 0.65),
                        itemBuilder: (context, index) {
                          return MainContainerWidget(
                            size: size,
                            data: data,
                            index: index,
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
