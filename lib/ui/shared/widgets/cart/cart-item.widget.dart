import 'package:ecommerce_full/blocs/cart.bloc.dart';
import 'package:ecommerce_full/models/cart-item.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final CartItemModel item;

  CartItem({
    @required this.item,
  });

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CartBloc>(context);
    final price = NumberFormat('#,##0.00', 'pt_BR');

    return Container(
      height: 120,
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.all(10),
            child: Image.network(
              widget.item.image,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.item.title),
                Text(
                  'R\$ ${price.format(widget.item.price)}',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                    'R\$ ${price.format(widget.item.price * widget.item.quantity)}'),
                Container(
                  width: 120,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        alignment: Alignment.center,
                        child: FlatButton(
                          child: Text('-'),
                          onPressed: () {
                            if (widget.item.quantity.toInt() == 1) {
                              bloc.decrease(widget.item);
                              print('Deu certo ');
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
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
                                          bloc.remove(widget.item);
                                        },
                                        child: Text(
                                          "DELETAR",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                          setState(() {
                                            widget.item.quantity = 1;
                                            bloc.calculateTotal();
                                          });
                                        },
                                        child: Text(
                                          "CANCELAR",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              print('decraise ');
                              bloc.decrease(widget.item);
                            }
                          },
                        ),
                      ),
                      Container(
                        width: 40,
                        alignment: Alignment.center,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 600),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return ScaleTransition(
                                child: child, scale: animation);
                          },
                          child: Text(
                            widget.item.quantity.toString(),
                            key: ValueKey<int>(
                              widget.item.quantity,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 40,
                        alignment: Alignment.center,
                        child: FlatButton(
                          child: Text('+'),
                          onPressed: () {
                            bloc.increase(widget.item);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
