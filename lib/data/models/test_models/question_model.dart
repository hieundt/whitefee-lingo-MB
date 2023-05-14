import 'package:dictionary/data/services/training_service.dart';

import 'option_model.dart';

class Question {
  String? id;
  bool? type;
  String? title;
  String? description;
  String? answer;
  List<String>? options;
  int? point;

  Question({
    this.id,
    this.type,
    this.title,
    this.description,
    this.answer,
    this.options,
    this.point,
  });

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    description = json['description'];
    answer = json['answer'];
    options = json['options'].cast<String>();
    point = json['point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['title'] = title;
    data['description'] = description;
    data['answer'] = answer;
    data['options'] = options;
    data['point'] = point;
    return data;
  }
}
