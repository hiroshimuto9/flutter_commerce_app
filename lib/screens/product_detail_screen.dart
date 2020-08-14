import 'package:flutter/material.dart';
import 'package:flutter_commerce_app/models/product.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetaiScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}