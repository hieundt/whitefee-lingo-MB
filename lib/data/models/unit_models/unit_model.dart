import 'package:dictionary/data/models/vocabulary_model/vocabulary_model.dart';

class Unit {
  String? id;
  String? name;
  String? image;
  List<Vocabulary>? vocabularies;

  Unit({this.id, this.name, this.image, this.vocabularies});

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    if (json['vocabularies'] != null) {
      vocabularies = <Vocabulary>[];
      json['vocabularies'].forEach((v) {
        vocabularies!.add(Vocabulary.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    if (vocabularies != null) {
      data['vocabularies'] = vocabularies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
