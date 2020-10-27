import 'package:dio/dio.dart';
import 'package:ecommerce_full/models/authenticate-user.model.dart';
import 'package:ecommerce_full/models/create-user.model.dart';
import 'package:ecommerce_full/models/user.model.dart';
import 'package:ecommerce_full/settings.dart';

class AccountRepository {
  Future<UserModel> authencate(AuthenticateModel model) async {
    final url = '${Settings.apiUrl}authenticate';

    Response response = await Dio().post(url, data: model);
    return UserModel.fromJson(response.data);
  }

  Future<UserModel> create(CreateUserModel model) async {
    final url = '${Settings.apiUrl}authenticate';

    Response response = await Dio().post(url, data: model);
    return UserModel.fromJson(response.data);
  }
}
