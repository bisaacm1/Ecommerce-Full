import 'package:ecommerce_full/blocs/cart.bloc.dart';
import 'package:ecommerce_full/ui/android/pages/account.page.dart';
import 'package:ecommerce_full/ui/android/pages/cart.page.dart';
import 'package:ecommerce_full/ui/android/pages/home.page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CartBloc>(context);
    Color _color = Colors.deepPurpleAccent;
    bool _animated = false;
    return Scaffold(
      body: TabBarView(
        children: [
          HomePage(),
          CartPage(),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart),
                bloc.cart.length == 0
                    ? Container()
                    : AnimatedPhysicalModel(
                        shape: BoxShape.circle,
                        color: Colors.red,
                        elevation: _animated ? 18 : 8,
                        shadowColor: Theme.of(context).primaryColor,
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              bloc.cart.length.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              key: ValueKey<int>(
                                bloc.cart.length,
                              ),
                            ),
                          ),
                        ),
                        duration: Duration(seconds: 2),
                      ),
              ],
            ),
          ),
          Tab(
            icon: Icon(Icons.perm_identity),
          ),
        ],
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Colors.black38,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(5),
        indicatorColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
