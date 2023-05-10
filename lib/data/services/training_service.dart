import 'package:dio/dio.dart';
import '../models/test_models/test_model.dart';

class TestService {
  var api = 'https://backenddictionary-production.up.railway.app/test';

  Future<List<Test>> getAllTest() async {
    final response = await Dio().get(api);
    List<Test> result =
        (response.data as List).map((e) => Test.fromJson(e)).toList();
    return result;
  }
}

class UnitService {
  var api = 'https://backenddictionary-production.up.railway.app/unit';
}
