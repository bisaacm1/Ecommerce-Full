import 'package:ecommerce_full/blocs/user.bloc.dart';
import 'package:ecommerce_full/ui/android/pages/settings.page.dart';
import 'package:ecommerce_full/ui/shared/widgets/account/autheticate-user-cart.widget.dart';
import 'package:ecommerce_full/ui/shared/widgets/account/unauthenticated-user-cart.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage();
                  },
                ),
              );
            },
            child: Icon(Icons.settings),
          )
        ],
      ),
      body: context.watch<UserBloc>().user == null
          ? UnauthenticateUserCard()
          : AuthenticatedUserCard(),
    );
  }
}
