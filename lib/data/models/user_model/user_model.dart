import 'package:dictionary/data/models/test_model/test_model.dart';
import 'package:dictionary/data/models/unit_model/unit_model.dart';
import 'package:dictionary/data/models/vocabulary_model/vocabulary_model.dart';

class User {
  String id;
  String email;
  String password;
  String userName;
  String? name;
  String dateOfBirth;
  List<Vocabulary>? favoriteVocabularies;
  List<Unit>? favoriteUnits;
  List<Test>? testPoint;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.userName,
    this.name,
    required this.dateOfBirth,
    this.favoriteVocabularies,
    this.favoriteUnits,
    this.testPoint,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        password = json['password'],
        userName = json['userName'],
        name = json['name'],
        dateOfBirth = json['dateOfBirth'],
        favoriteVocabularies = json['favoriteVocabularies'] != null
            ? List<Vocabulary>.from(
                json['favoriteVocabularies'].map((x) => Vocabulary.fromJson(x)))
            : null,
        favoriteUnits = json['favoriteUnits'] != null
            ? List<Unit>.from(
                json['favoriteUnits'].map((x) => Unit.fromJson(x)))
            : null,
        testPoint = json['testPoint'] != null
            ? List<Test>.from(json['testPoint'].map((x) => Test.fromJson(x)))
            : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['userName'] = userName;
    data['name'] = name;
    data['dateOfBirth'] = dateOfBirth;
    if (favoriteVocabularies != null) {
      data['favoriteVocabularies'] =
          favoriteVocabularies!.map((v) => v.toJson()).toList();
    }
    if (favoriteUnits != null) {
      data['favoriteUnits'] = favoriteUnits!.map((v) => v.toJson()).toList();
    }
    if (testPoint != null) {
      data['testPoint'] = testPoint!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
