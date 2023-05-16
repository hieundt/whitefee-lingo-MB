import 'favorite_unit_model.dart';
import 'favorite_vocabulary_model.dart';
import 'test_history_model.dart';

class User {
  String? id;
  String? email;
  String? password;
  String? userName;
  String? dateOfBirth;
  List<FavoriteVocabulary>? favoriteVocabularies;
  List<FavoriteUnit>? favoriteUnit;
  List<TestHistory>? testHistory;

  User({
    this.id,
    this.email,
    this.password,
    this.userName,
    this.dateOfBirth,
    this.favoriteVocabularies,
    this.favoriteUnit,
    this.testHistory,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    userName = json['userName'];
    dateOfBirth = json['dateOfBirth'];
    if (json['favoriteVocabularies'] != null) {
      favoriteVocabularies = <FavoriteVocabulary>[];
      json['favoriteVocabularies'].forEach((v) {
        favoriteVocabularies!.add(FavoriteVocabulary.fromJson(v));
      });
    }
    if (json['favoriteUnit'] != null) {
      favoriteUnit = <FavoriteUnit>[];
      json['favoriteUnit'].forEach((v) {
        favoriteUnit!.add(FavoriteUnit.fromJson(v));
      });
    }
    if (json['testHistory'] != null) {
      testHistory = <TestHistory>[];
      json['testHistory'].forEach((v) {
        testHistory!.add(TestHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['userName'] = userName;
    data['dateOfBirth'] = dateOfBirth;
    if (favoriteVocabularies != null) {
      data['favoriteVocabularies'] =
          favoriteVocabularies!.map((v) => v.toJson()).toList();
    }
    if (favoriteUnit != null) {
      data['favoriteUnit'] = favoriteUnit!.map((v) => v.toJson()).toList();
    }
    if (testHistory != null) {
      data['testHistory'] = testHistory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
