import 'package:flutter/material.dart';
import 'package:machine_test_wincept/controller/product_controller.dart';
import 'package:machine_test_wincept/utils/colors.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productName;
  final String desciption;
  final String image;
  final String price;
  const ProductDetailScreen(
      {super.key,
      required this.productName,
      required this.desciption,
      required this.image,
      required this.price});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductController>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              provider.quantity = 1;
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: primaryColor,
            )),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: size.height * 0.35,
                width: size.width * 0.7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 1,
                          spreadRadius: 1,
                          color: Colors.grey.shade400,
                          offset: const Offset(0.5, 0.5))
                    ],
                    image: DecorationImage(
                        image: NetworkImage(
                          widget.image,
                        ),
                        fit: BoxFit.cover)),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productName,
                      style: const TextStyle(
                          fontSize: 32,
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                    ),
                    const Text(
                      'With Chocolate',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        provider.lessQuantity();
                      },
                      child: const CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.brown,
                        child: Center(
                          child: Text(
                            '—',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Consumer<ProductController>(
                      builder: (context, value, child) => Text(
                        value.quantity.toString(),
                        style: const TextStyle(
                            color: thirdColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        provider.addQuantity();
                      },
                      child: const CircleAvatar(
                        radius: 16,
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "₹ ${widget.price}",
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: thirdColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12),
            child: Text(
              widget.desciption,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 22.0,
        ),
        child: InkWell(
          onTap: () {
            provider.addData(
                context: context,
                name: widget.productName,
                image: widget.image,
                description: widget.desciption,
                price: widget.price);
          },
          child: Consumer<ProductController>(
            builder: (context, value, child) => Container(
              alignment: Alignment.center,
              width: size.width,
              height: size.height * 0.08,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Place the order (₹ ${value.calculatePrice(int.parse(widget.price), value.quantity)})",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
