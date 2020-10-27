import 'package:ecommerce_full/blocs/home.bloc.dart';
import 'package:ecommerce_full/models/category-list-item.model.dart';
import 'package:ecommerce_full/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  final CategoryListItemModel item;

  CategoryCard({@required this.item});
  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);
    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: item.tag == bloc.selectedCategory
            ? Theme.of(context).primaryColor.withOpacity(0.3)
            : Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(70),
      ),
      child: FlatButton(
        onPressed: () {
          bloc.changeCategory(item.tag);
        },
        child:
            Image.asset('assets/categories/${Settings.theme}/${item.tag}.png'),
      ),
    );
  }
}
