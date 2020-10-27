import 'package:ecommerce_full/ui/android/pages/login.page.dart';
import 'package:ecommerce_full/ui/android/pages/signup.page.dart';
import 'package:flutter/material.dart';

class UnauthenticateUserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 60,
        ),
        FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => LoginPage(),
              ),
            );
          },
          child: Text('Autentique-se'),
        ),
        FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SignupPage(),
              ),
            );
          },
          child: Text('Ainda não sou cadastrado'),
        ),
      ],
    );
  }
}
