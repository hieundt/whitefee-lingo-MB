import 'package:dictionary/data/models/vocabulary_model/vocabulary_model.dart';

class Unit {
  String id;
  String name;
  String image;
  List<Vocabulary> vocabularies;

  Unit({
    required this.id,
    required this.name,
    required this.image,
    required this.vocabularies,
  });

  Unit.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        vocabularies = json['vocabularies'] = List<Vocabulary>.from(
            json['vocabularies'].map((x) => Vocabulary.fromJson(x)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['vocabularies'] = vocabularies.map((v) => v.toJson()).toList();
    return data;
  }
}
