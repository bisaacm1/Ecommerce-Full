import 'package:ecommerce_full/blocs/user.bloc.dart';
import 'package:ecommerce_full/models/create-user.model.dart';
import 'package:ecommerce_full/ui/android/pages/account.page.dart';
import 'package:ecommerce_full/ui/shared/validatores/custom.validators.dart';
import 'package:ecommerce_full/ui/shared/widgets/account/unauthenticated-user-cart.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  var user = CreateUserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Nome Inválido';
                  }
                  return null;
                },
                onSaved: (value) {
                  user.name = value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  return CustomValidators.isEmail(value);
                },
                onSaved: (value) {
                  user.email = value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Usuário',
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Usuário Inválido';
                  }
                  return null;
                },
                onSaved: (value) {
                  user.username = value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
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
                  if (value.length < 6) {
                    return 'A senha deve ter no mínimo 6 caracteres';
                  }
                  return null;
                },
                onSaved: (value) {
                  user.password = value;
                },
              ),
              FlatButton(
                child: Text('Cadastrar'),
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    _formkey.currentState.save();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AccountPage(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future create(BuildContext context) async {
    var bloc = Provider.of<UserBloc>(context, listen: false);
    var res = await bloc.create(user);

    if (res == null) {
      final snackbar =
          SnackBar(content: Text('Não foi possível realizar seu cadastro'));
      _scaffoldkey.currentState.showSnackBar(snackbar);
    } else {
      Navigator.pop(context);
      final snackbar = SnackBar(content: Text('Bem-vindo! Autentique-se'));
      _scaffoldkey.currentState.showSnackBar(snackbar);
    }
  }
}
