import 'package:ecommerce_full/blocs/user.bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticatedUserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<UserBloc>(context, listen: false);

    return Container(
      child: Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                SizedBox(height: 20),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(bloc.user.image),
                    ),
                    color: Theme.of(context).primaryColor,
                    border: Border.all(
                      width: 4,
                      color: Theme.of(context).unselectedWidgetColor,
                    ),
                    borderRadius: BorderRadius.circular(200),
                  ),
                ),
                SizedBox(height: 20),
                Text('Bem-vindo ${bloc.user.name}'),
                SizedBox(height: 10),
                FlatButton(
                  child: Text('Sair'),
                  onPressed: bloc.logout,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
