import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'cart.dart';

class OrderItem {
  final String id;
  final DateTime dateTime;
  final List<CartItem> products;
  final double amount;

  OrderItem({
    @required this.id,
    @required this.dateTime,
    @required this.products,
    @required this.amount,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> addOrder(List<CartItem> products, double amount) async {
    final String url = "https://shop-app-b88e9.firebaseio.com/orders.json";
    final DateTime timeStamp = DateTime.now();

    final response = await http.post(
      url,
      body: json.encode({
        "amount": amount,
        "dateTime": timeStamp.toIso8601String(),
        "products": products
            .map(
              (cartProduct) => {
                'id': cartProduct.id,
                'title': cartProduct.title,
                'quantity': cartProduct.quantity,
                'price': cartProduct.price,
              },
            )
            .toList()
      }),
    );

    _orders.insert(
      0,
      OrderItem(
        id: json.decode(response.body)['name'],
        products: products,
        amount: amount,
        dateTime: timeStamp,
      ),
    );
    notifyListeners();
  }
}
