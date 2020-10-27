import 'dart:convert';

import 'package:ecommerce_full/models/authenticate-user.model.dart';
import 'package:ecommerce_full/models/create-user.model.dart';
import 'package:ecommerce_full/models/user.model.dart';
import 'package:ecommerce_full/repositories/account.repository.dart';
import 'package:ecommerce_full/settings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc extends ChangeNotifier {
  var user = UserModel();
  var repository = AccountRepository();

  UserBloc() {
    user = null;
    loadUser();
  }

  Future<UserModel> authenticate(AuthenticateModel model) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var res = await repository.authencate(model);
      user = res;
      await prefs.setString('user', jsonEncode(user));
      return res;
    } catch (err) {
      return errorHandler(err);
    }
  }

  Future<UserModel> create(CreateUserModel model) async {
    try {
      var res = await repository.create(model);
      return res;
    } catch (err) {
      return errorHandler(err);
    }
  }

  Future logout() async {
    var prefs = await SharedPreferences.getInstance();
    user = null;
    await prefs.setString('user', null);
    Settings.user = user;
    notifyListeners();
  }

  Future loadUser() async {
    var prefs = await SharedPreferences.getInstance();
    var userData = prefs.getString('user');
    if (userData != null) {
      var json = jsonDecode(userData);
      user = UserModel.fromJson(json);
      Settings.user = user;
    }
  }

  errorHandler(err) {
    print(err);
    user = null;
    return null;
  }
}
