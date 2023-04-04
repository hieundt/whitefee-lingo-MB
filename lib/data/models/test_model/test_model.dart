import 'package:dictionary/data/models/question_model/question_model.dart';

class Test {
  String? id;
  String? name;
  String? image;
  int? totalPoint;
  List<Question>? questions;

  Test({this.id, this.name, this.image, this.totalPoint, this.questions});

  Test.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    totalPoint = json['totalPoint'];
    if (json['questions'] != null) {
      questions = <Question>[];
      json['questions'].forEach((v) {
        questions!.add(Question.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['totalPoint'] = totalPoint;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
