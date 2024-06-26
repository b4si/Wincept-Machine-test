import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductController with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  int quantity = 1;

  addQuantity() {
    quantity++;
    notifyListeners();
  }

  lessQuantity() {
    if (quantity > 1) {
      quantity--;
      notifyListeners();
    }
  }

  int calculatePrice(int price, int quantity) {
    int result = price * quantity;

    return result;
  }

  void addData({
    required String name,
    required String image,
    required String description,
    required String price,
    required BuildContext context,
  }) async {
    try {
      await _firestore.collection('orders').add({
        'name': name,
        'description': description,
        'price': price,
        'quantity': quantity.toString(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green.shade800,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(15.0),
          elevation: 6.0,
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          content: const Text('Order Succesfully done'),
        ),
      );

      print('Data added successfully');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(15.0),
          elevation: 6.0,
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          content: Text('Something went wrong ${e.toString()}'),
        ),
      );
      print('Failed to add data: $e');
    }
  }
}
