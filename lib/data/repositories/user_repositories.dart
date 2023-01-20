import 'package:fake_json/data/data.dart';
import 'package:fake_json/data/models/users_model/users_model.dart';

class UserRepository {
  Future<List<UsersModel>?> getDataList() async {
    return UserDataSource().getData();
  }
}
