class Option {
  String? id;
  String? value;
  bool? isCorrect;

  Option({
    required this.id,
    this.value,
    this.isCorrect,
  });

  Option.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    isCorrect = json['isCorrect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['value'] = value;
    data['isCorrect'] = isCorrect;
    return data;
  }
}
