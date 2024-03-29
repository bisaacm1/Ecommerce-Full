﻿import 'package:ecommerce_full/models/product-list-item.model.dart';
import 'package:ecommerce_full/ui/shared/widgets/product/product-card.widget.dart';
import 'package:ecommerce_full/ui/shared/widgets/shared/loader.widget.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final List<ProductListItemModel> products;

  ProductList({@required this.products});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410,
      child: Loader(object: products, callback: list),
    );
  }

  Widget list() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(5),
            child: ProductCard(item: products[index]),
          );
        });
  }
}
