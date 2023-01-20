import 'dart:convert';

import 'package:fake_json/data/models/users_model/user.dart';
import 'package:fake_json/data/models/users_model/users_model.dart';
import 'package:flutter/services.dart';

class SearchDataSource {
  Future<List<User>?> getData({required String keyword}) async {
    List<User> model;
    try {
      final response =
          await rootBundle.loadString('assets/users_responses.json');
      final List data = await json.decode(response) as List<dynamic>;
      model = data
          .map((e) => UsersModel.fromJson(e))
          .first
          .data!
          .users!
          .where((user) =>
              (user.profile!.name!
                  .toLowerCase()
                  .contains(keyword.toLowerCase())) ||
              user.company!.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
      return model;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
