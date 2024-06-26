import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_wincept/utils/colors.dart';
import 'package:machine_test_wincept/view/product_detail_screen.dart';

class MainContainerWidget extends StatelessWidget {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> data;
  final int index;
  const MainContainerWidget({
    super.key,
    required this.size,
    required this.data,
    required this.index,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              desciption: data[index]['description'],
              image: data[index]['image'],
              price: data[index]['price'],
              productName: data[index]['product_name'],
            ),
          ),
        );
      },
      child: Container(
        height: size.height * 0.35,
        width: size.width * 0.35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(
                    0.5,
                    0.5,
                  ),
                  color: Colors.grey,
                  blurRadius: 1,
                  spreadRadius: 0)
            ],
            color: Colors.grey.shade200),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.015,
            ),
            SizedBox(
              width: size.width * 0.37,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(data[index]['image']),
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    data[index]['product_name'],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "With Chocolate",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '₹ ${data[index]['price']}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        color: thirdColor,
                        fontSize: 20),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 4,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(
                                desciption: data[index]['description'],
                                image: data[index]['image'],
                                price: data[index]['price'],
                                productName: data[index]['product_name'],
                              ),
                            ),
                          );
                        },
                        child: const CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.brown,
                          child: Center(
                            child: Text(
                              '+',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
