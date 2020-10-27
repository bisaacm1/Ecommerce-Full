import 'package:ecommerce_full/blocs/cart.bloc.dart';
import 'package:ecommerce_full/models/cart-item.model.dart';
import 'package:ecommerce_full/models/product-list-item.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCard extends StatelessWidget {
  final ProductListItemModel item;

  AddToCard({
    @required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CartBloc>(context);
    var cartItem = CartItemModel(
      id: item.id,
      title: item.title,
      quantity: 1,
      price: item.price,
      image: item.image,
    );

    if (!bloc.itemInCart(cartItem)) {
      return Container(
        width: 80,
        height: 40,
        child: FlatButton(
          color: Theme.of(context).primaryColor,
          child: Icon(Icons.add_shopping_cart),
          textColor: Colors.white,
          onPressed: () {
            bloc.add(cartItem);
            final snackBar = SnackBar(
              content: Text('${item.title} adicionado'),
            );
            Scaffold.of(context).showSnackBar(snackBar);
          },
        ),
      );
    } else {
      return Container(
        width: 80,
        height: 40,
        child: FlatButton(
          color: Colors.red,
          child: Icon(Icons.remove_shopping_cart),
          textColor: Colors.white,
          onPressed: () {
            bloc.remove(cartItem);
            final snackBar = SnackBar(
              content: Text('${item.title} removido'),
            );
            Scaffold.of(context).showSnackBar(snackBar);
          },
        ),
      );
    }
  }
}
