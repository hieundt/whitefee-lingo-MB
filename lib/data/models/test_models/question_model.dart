import 'option_model.dart';

class Question {
  String? id;
  bool? type;
  String? title;
  String? description;
  String? answers;
  String? point;
  List<Option>? options;

  Question({
    this.id,
    this.type,
    this.title,
    this.description,
    this.answers,
    this.point,
    this.options,
  });

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    description = json['description'];
    answers = json['answers'];
    point = json['point'];
    if (json['options'] != null) {
      options = <Option>[];
      json['options'].forEach((v) {
        options!.add(Option.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['title'] = title;
    data['description'] = description;
    data['answers'] = answers;
    data['point'] = point;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
