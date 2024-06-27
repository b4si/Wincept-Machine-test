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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0.5, 0.5),
                                blurRadius: 1,
                                spreadRadius: 0,
                                color: Colors.grey.shade400)
                          ]),
                      child: Row(
                        children: [
                          SizedBox(
                            height: size.height * 0.15,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                data[index]['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data[index]['name'],
                                style: const TextStyle(
                                    color: primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Quantity - ${data[index]['quantity']}',
                                style: const TextStyle(
                                    color: primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Net Total - ₹ ${calculateSubtotal(
                                  data[index]['quantity'],
                                  data[index]['price'],
                                )}',
                                style: const TextStyle(
                                    color: primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }),
    );
  }

  String calculateSubtotal(String qty, String price) {
    int result = int.parse(price) * int.parse(qty);
    return result.toString();
  }
}
