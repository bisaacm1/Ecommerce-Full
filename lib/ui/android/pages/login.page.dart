import 'package:ecommerce_full/blocs/user.bloc.dart';
import 'package:ecommerce_full/models/authenticate-user.model.dart';
import 'package:ecommerce_full/ui/android/pages/account.page.dart';
import 'package:ecommerce_full/ui/shared/widgets/account/autheticate-user-cart.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var username = '';
  var password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'usuario',
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Usuario Inválido';
                  }
                  return null;
                },
                onSaved: (value) {
                  username = value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'senha',
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Senha Inválida';
                  }
                  return null;
                },
                onSaved: (value) {
                  password = value;
                },
              ),
              FlatButton(
                child: Text('Entrar'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();

                    authenticate(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future authenticate(BuildContext context) async {
    var bloc = Provider.of<UserBloc>(context, listen: false);

    var user = await bloc.authenticate(
      AuthenticateModel(
        username: username,
        password: password,
      ),
    );

    if (user != null) {
      //Navigator.pop(context);
      return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => AccountPage(),
        ),
      );
    }

    final snackbar = SnackBar(
      content: Text('Usuário ou senha inválidos'),
    );
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }
}
