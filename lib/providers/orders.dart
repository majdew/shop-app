import 'package:flutter/material.dart';

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

  void addOrder(
    List<CartItem> products,
    double amount,
  ) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        products: products,
        amount: amount,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
