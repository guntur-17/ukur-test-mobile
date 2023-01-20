import 'dart:convert';

import 'package:fake_json/data/models/users_model/users_model.dart';
import 'package:flutter/services.dart';

class UserDataSource {
  Future<List<UsersModel>?> getData() async {
    List<UsersModel> model;
    try {
      final response =
          await rootBundle.loadString('assets/users_responses.json');
      final List data = await json.decode(response) as List<dynamic>;
      model = data.map((e) => UsersModel.fromJson(e)).toList();
      return model;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
