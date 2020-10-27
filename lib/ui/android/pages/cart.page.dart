import 'package:ecommerce_full/blocs/cart.bloc.dart';
import 'package:ecommerce_full/models/cart-item.model.dart';
import 'package:ecommerce_full/ui/android/pages/tabs.page.dart';
import 'package:ecommerce_full/ui/shared/widgets/cart/cart-item.widget.dart';
import 'package:ecommerce_full/ui/shared/widgets/shared/loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  CartBloc bloc;
  final price = NumberFormat('#,##0', 'pt_BR');
  List<CartItemModel> items = List<CartItemModel>();

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<CartBloc>(context);
    items = bloc.cart;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Expanded(
              child: Loader(
                object: bloc.cart,
                callback: list,
              ),
            ),
            Container(
              height: 80,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'R\$ ${price.format(bloc.total)}',
                    style: TextStyle(fontSize: 30),
                  ),
                  FlatButton(
                    child: Text(
                      'Checkout',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Dismissible(
          confirmDismiss: (DismissDirection direction) async {
            return await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  title: Center(
                    child: Icon(
                      Icons.info_outline,
                      color: Theme.of(context).primaryColor,
                      size: 100,
                    ),
                  ),
                  content: Text(
                    "Deseja deletar esse item ? ",
                    textAlign: TextAlign.center,
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                        bloc.remove(items[index]);
                      },
                      child: Text(
                        "DELETAR",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    FlatButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(
                        "CANCELAR",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: CartItem(
            item: items[index],
          ),
          key: Key(items[index].id),
          onDismissed: (direction) => {},
          background: Container(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Icon(
                Icons.restore_from_trash,
                size: 40,
              ),
            ),
            color: Colors.red[300],
          ),
          secondaryBackground: Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Icon(
                Icons.restore_from_trash,
                size: 40,
              ),
            ),
            color: Colors.red[300],
          ),
        );
      },
    );
  }
}
