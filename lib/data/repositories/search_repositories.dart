import 'package:fake_json/data/datasources/search_datasource.dart';
import 'package:fake_json/data/models/users_model/user.dart';

class SearchRepository {
  Future<List<User>?> getDataList({required String query}) async {
    return SearchDataSource().getData(keyword: query);
  }
}
