import 'question_model.dart';

class Test {
  String? id;
  String? name;
  String? image;
  List<Question>? questions;

  Test({
    this.id,
    this.name,
    this.image,
    this.questions,
  });

  Test.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    if (json['questions'] != null) {
      (json['questions'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .map((e) => questions!.add(Question.fromJson(e)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
