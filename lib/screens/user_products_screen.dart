import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/user_product_item.dart';
import '../widgets/app_drawer.dart';
import '../screens/edit_product_screen.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = "/user-products";

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Products",
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_circle,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return UserProductItem(
            products[index].id,
            products[index].title,
            products[index].imageUrl,
          );
        },
        itemCount: products.length,
      ),
    );
  }
}
