import 'package:dictionary/data/models/test_models/question_model.dart';
import 'package:dio/dio.dart';
import '../models/test_models/option_model.dart';
import '../models/test_models/test_model.dart';

class TestService {
  var api = 'https://backenddictionary-production.up.railway.app';

  Future<List<Test>> getAllTest() async {
    var testApi = '$api/test';
    final response = await Dio().get(testApi);
    List<Test> result =
        (response.data as List).map((e) => Test.fromJson(e)).toList();
    return result;
  }

  Future<Test> getTestById(String id) async {
    var testApi = '$api/test/$id';
    final response = await Dio().get(testApi);
    final result = Test.fromJson(response.data[0]);
    return result;
  }

  Future<List<Question>> getAllQuestionById(String testId) async {
    var questionApi = '$api/question/$testId';
    final response = await Dio().get(questionApi);
    List<Question> result =
        (response.data as List).map((e) => Question.fromJson(e)).toList();
    return result;
  }

  Future<List<Option>> getAllOptionById(String questionId) async {
    var optionApi = '$api/option/$questionId';
    final response = await Dio().get(optionApi);
    List<Option> result =
        (response.data as List).map((e) => Option.fromJson(e)).toList();
    return result;
  }
}

class UnitService {
  var api = 'https://backenddictionary-production.up.railway.app/unit';
}
