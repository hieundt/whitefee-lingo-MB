class Vocabulary {
  String? id;
  String? type;
  String? word;
  String? hint;
  String? phonetics;
  String? pronounce;
  String? image;
  String? meaning;

  Vocabulary(
      {this.id,
      this.type,
      this.word,
      this.hint,
      this.phonetics,
      this.pronounce,
      this.image,
      this.meaning});

  Vocabulary.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    word = json['word'];
    hint = json['hint'];
    phonetics = json['phonetics'];
    pronounce = json['pronouce'];
    image = json['image'];
    meaning = json['meaning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['word'] = word;
    data['hint'] = hint;
    data['phonetics'] = phonetics;
    data['pronouce'] = pronounce;
    data['image'] = image;
    data['meaning'] = meaning;
    return data;
  }
}
