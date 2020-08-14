import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/products_grid.dart';

enum FIlterOptions {
  Favorites,
  ALl,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    var scaffold2 = Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FIlterOptions selectedValue) {
              setState(() {
                if (selectedValue == FIlterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FIlterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FIlterOptions.ALl,
              ),
            ],
          ),
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
    var scaffold = scaffold2;
    return scaffold;
  }
}