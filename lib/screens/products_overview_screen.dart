import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/products_grid.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions value) {
              if (value == FilterOptions.Favorites) {
                products.showFavoritesOnly();
              } else {
                products.showAll();
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("Only Favorites"),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text("show all"),
                value: FilterOptions.All,
              ),
            ],
          ),
        ],
        title: Text("MyShop"),
      ),
      body: ProductsGrid(),
    );
  }
}
