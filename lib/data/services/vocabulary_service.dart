import 'package:dio/dio.dart';
import '../models/vocabulary_model/vocabulary_model.dart';

class VocabularyService {
  var api = 'http://localhost:3000/api/vocabularies';

  Future<Vocabulary> getVocabularyByWord(String word) async {
    final response = await Dio().get('$api/byword/$word');
    final result = Vocabulary.fromJson(response.data[0]);
    return result;
  }

  Future<Vocabulary> getVocabularyById(String id) async {
    final response = await Dio().get('$api/byid/$id');
    final result = Vocabulary.fromJson(response.data);
    return result;
  }

  Future<List<Vocabulary>> getAllVocabulary() async {
    final response = await Dio().get(api);
    List<Vocabulary> result =
        (response.data as List).map((e) => Vocabulary.fromJson(e)).toList();
    return result;
  }
}
