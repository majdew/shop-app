import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;
  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text("\$${widget.order.amount.toStringAsFixed(2)}"),
            subtitle: Text(
              DateFormat("y - MM - dd . HH:mm").format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(
                  () {
                    _expanded = !_expanded;
                  },
                );
              },
            ),
          ),
          if (_expanded)
            Container(
              height: min(
                widget.order.products.length * 20.0 + 20,
                150,
              ),
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: widget.order.products
                    .map(
                      (product) => ListTile(
                        title: Text(
                          product.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing:
                            Text("\$${product.price} - ${product.quantity}x"),
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
