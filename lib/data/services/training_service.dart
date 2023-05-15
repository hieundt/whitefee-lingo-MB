import 'package:dictionary/data/models/test_models/question_model.dart';
import 'package:dictionary/data/models/unit_models/unit_has_vocabulary_model.dart';
import 'package:dictionary/data/models/vocabulary_model/vocabulary_model.dart';
import 'package:dictionary/data/services/vocabulary_service.dart';
import 'package:dio/dio.dart';
import '../models/test_models/option_model.dart';
import '../models/test_models/test_model.dart';
import '../models/unit_models/unit_model.dart';

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
    final result = Test.fromJson(response.data);
    return result;
  }

  Future<List<Question>> getAllQuestionOfTest(String testId) async {
    var questionApi = '$api/question/$testId';
    final response = await Dio().get(questionApi);
    List<Question> result =
        (response.data as List).map((e) => Question.fromJson(e)).toList();
    return result;
  }

  Future<List<Option>> getAllOptionOfQuestion(String questionId) async {
    var optionApi = '$api/option/$questionId';
    final response = await Dio().get(optionApi);
    List<Option> result =
        (response.data as List).map((e) => Option.fromJson(e)).toList();
    return result;
  }
}

class UnitService {
  Future<Unit> getUnitByName(String name) async {
    var api = 'https://backenddictionary-production.up.railway.app/unit';
    var unitApi = '$api/byname/$name';
    final response = await Dio().get(unitApi);
    final result = Unit.fromJson(response.data);
    return result;
  }

  Future<List<Vocabulary>> getVocabularyOfUnit(String unitId) async {
    var api =
        'https://backenddictionary-production.up.railway.app/unithasvocabulary';

    var unitVocaApi = '$api/byid/$unitId';
    final response = await Dio().get(unitVocaApi);
    List<UnitHasVocabulary> unitHasVocabulary = (response.data as List)
        .map((e) => UnitHasVocabulary.fromJson(e))
        .toList();

    List<Vocabulary> vocabularyOfUnit = [];
    for (var item in unitHasVocabulary) {
      var vocabulary =
          await VocabularyService().getVocabularyById(item.vocabularyId!);
      vocabularyOfUnit.add(vocabulary);
    }

    return vocabularyOfUnit;
  }
}
