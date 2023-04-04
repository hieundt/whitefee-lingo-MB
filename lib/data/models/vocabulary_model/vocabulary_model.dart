class Vocabulary {
  final String id;
  final String word;
  final String hint;
  final String phonetics;
  final String pronounce;
  final String image;
  final String meaning;
  final bool? isFavorite;

  Vocabulary({
    required this.id,
    required this.word,
    required this.hint,
    required this.phonetics,
    required this.pronounce,
    required this.image,
    required this.meaning,
    this.isFavorite,
  });

  Vocabulary.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        word = json['word'],
        hint = json['hint'],
        phonetics = json['phonetics'],
        pronounce = json['pronounce'],
        image = json['image'],
        meaning = json['meaning'],
        isFavorite = json['isFavorite'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['word'] = word;
    data['hint'] = hint;
    data['phonetics'] = phonetics;
    data['pronounce'] = pronounce;
    data['image'] = image;
    data['meaning'] = meaning;
    data['isFavorite'] = isFavorite;
    return data;
  }
}
