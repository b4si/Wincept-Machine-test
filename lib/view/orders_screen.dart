import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_wincept/utils/colors.dart';
import 'package:machine_test_wincept/view/widgets/shimmer_container.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final ordersStream =
      FirebaseFirestore.instance.collection('orders').snapshots();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: primaryColor,
            )),
      ),
      body: StreamBuilder(
          stream: ordersStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Image.asset(
                  'asset/Network error.jpg',
                  height: size.height * 0.3,
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ShimmerContainer();
                },
              );
            } else {
              var data = snapshot.data!.docs;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListView(
                    children: [
                      Row(
                        children: [
                          Image.network(
                            data[index]['image'],
                          )
                        ],
                      )
                    ],
                  );
                },
              );
            }
          }),
    );
  }
}
