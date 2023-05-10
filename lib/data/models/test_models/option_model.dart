class Option {
  String? id;
  String? value;
  bool? correct;

  Option({
    required this.id,
    this.value,
    this.correct,
  });

  Option.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    correct = json['correct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['value'] = value;
    data['correct'] = correct;
    return data;
  }
}
