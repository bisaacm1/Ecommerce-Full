﻿import 'package:ecommerce_full/models/category-list-item.model.dart';
import 'package:ecommerce_full/ui/shared/widgets/category/category-card.widget.dart';
import 'package:ecommerce_full/ui/shared/widgets/shared/loader.widget.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryListItemModel> categories;

  CategoryList({this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Loader(
        object: categories,
        callback: list,
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        CategoryListItemModel item = categories[index];

        return Padding(
          padding: EdgeInsets.all(5),
          child: CategoryCard(item: item),
        );
      },
    );
  }
}
