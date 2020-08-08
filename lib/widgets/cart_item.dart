import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem(
    this.id,
    this.title,
    this.price,
    this.quantity,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: FittedBox(
                child: Text(
                  "\$$price",
                ),
              ),
            ),
          ),
          title: Text(title),
          subtitle: Text(
            "Total : \$${price * quantity}",
          ),
          trailing: Text("$quantity x"),
        ),
      ),
    );
  }
}
