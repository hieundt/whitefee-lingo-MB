import 'package:dictionary/res/themes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

//*Vocabulary
class ManageVocabulary extends StatefulWidget {
  const ManageVocabulary({super.key});

  @override
  State<ManageVocabulary> createState() => _ManageVocabularyState();
}

class _ManageVocabularyState extends State<ManageVocabulary> {
  late TextEditingController _type;
  late TextEditingController _word;
  late TextEditingController _hint;
  late TextEditingController _phonetics;
  late TextEditingController _pronounce;
  late TextEditingController _image;
  late TextEditingController _meaning;

  @override
  void initState() {
    _type = TextEditingController();
    _word = TextEditingController();
    _hint = TextEditingController();
    _phonetics = TextEditingController();
    _pronounce = TextEditingController();
    _image = TextEditingController();
    _meaning = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _type.dispose();
    _word.dispose();
    _hint.dispose();
    _phonetics.dispose();
    _pronounce.dispose();
    _image.dispose();
    _meaning.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Dio().get(
        'https://backenddictionary-production.up.railway.app/vocabulary',
      ),
      builder: (context, snapshot) {
        if (!(snapshot.connectionState == ConnectionState.waiting)) {
          return Container(
            decoration: AppContainerStyle.border.copyWith(
              color: AppColors.lightBrown,
            ),
            child: Column(
              children: [
                Text(
                  'Vocabulary',
                  style: AppTextStyle.bold35,
                ),
                TextField(
                  controller: _type,
                  decoration: const InputDecoration(hintText: 'type'),
                ),
                TextField(
                  controller: _word,
                  decoration: const InputDecoration(hintText: 'word'),
                ),
                TextField(
                  controller: _hint,
                  decoration: const InputDecoration(hintText: 'hint'),
                ),
                TextField(
                  controller: _phonetics,
                  decoration: const InputDecoration(hintText: 'phonetics'),
                ),
                TextField(
                  controller: _pronounce,
                  decoration: const InputDecoration(hintText: 'pronounce'),
                ),
                TextField(
                  controller: _image,
                  decoration: const InputDecoration(hintText: 'image'),
                ),
                TextField(
                  controller: _meaning,
                  decoration: const InputDecoration(hintText: 'meaning'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await Dio().post(
                      'https://backenddictionary-production.up.railway.app/vocabulary',
                      data: {
                        "type": _type.text.toString().trim(),
                        "word": _word.text.toString().trim(),
                        "hint": _hint.text.toString().trim(),
                        "phonetics": _phonetics.text.toString().trim(),
                        "pronouce": _pronounce.text.toString().trim(),
                        "image": _image.text.toString().trim(),
                        "meaning": _meaning.text.toString().trim(),
                      },
                    );
                    setState(() {
                      _type.clear();
                      _word.clear();
                      _hint.clear();
                      _phonetics.clear();
                      _pronounce.clear();
                      _image.clear();
                      _meaning.clear();
                    });
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

//* Test
class ManageTest extends StatefulWidget {
  const ManageTest({super.key});

  @override
  State<ManageTest> createState() => _ManageTestState();
}

class _ManageTestState extends State<ManageTest> {
  late TextEditingController _optValue;
  late TextEditingController _optCorrect;

  late TextEditingController _quesType;
  late TextEditingController _quesTitle;
  late TextEditingController _quesDes;
  late TextEditingController _quesAns;
  late TextEditingController _quesPoint;
  late TextEditingController _quesOptA;
  late TextEditingController _quesOptB;
  late TextEditingController _quesOptC;
  late TextEditingController _quesOptD;

  late TextEditingController _testName;
  late TextEditingController _testImage;
  late TextEditingController _testQues1;
  late TextEditingController _testQues2;
  late TextEditingController _testQues3;
  late TextEditingController _testQues4;
  late TextEditingController _testQues5;
  @override
  void initState() {
    _optValue = TextEditingController();
    _optCorrect = TextEditingController();

    _quesType = TextEditingController();
    _quesTitle = TextEditingController();
    _quesDes = TextEditingController();
    _quesAns = TextEditingController();
    _quesPoint = TextEditingController();
    _quesOptA = TextEditingController();
    _quesOptB = TextEditingController();
    _quesOptC = TextEditingController();
    _quesOptD = TextEditingController();

    _testName = TextEditingController();
    _testImage = TextEditingController();
    _testQues1 = TextEditingController();
    _testQues2 = TextEditingController();
    _testQues3 = TextEditingController();
    _testQues4 = TextEditingController();
    _testQues5 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _optValue.dispose();
    _optCorrect.dispose();

    _quesType.dispose();
    _quesTitle.dispose();
    _quesDes.dispose();
    _quesAns.dispose();
    _quesPoint.dispose();
    _quesOptA.dispose();
    _quesOptB.dispose();
    _quesOptC.dispose();
    _quesOptD.dispose();

    _testName.dispose();
    _testImage.dispose();
    _testQues1.dispose();
    _testQues2.dispose();
    _testQues3.dispose();
    _testQues4.dispose();
    _testQues5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //*Option
        FutureBuilder(
          future: Dio().get(
            'https://backenddictionary-production.up.railway.app/option',
          ),
          builder: (context, snapshot) {
            if (!(snapshot.connectionState == ConnectionState.waiting)) {
              return Container(
                decoration: AppContainerStyle.border,
                child: Column(
                  children: [
                    Text(
                      'Option',
                      style: AppTextStyle.bold35,
                    ),
                    TextField(
                      controller: _optValue,
                      decoration: const InputDecoration(hintText: 'value'),
                    ),
                    TextField(
                      controller: _optCorrect,
                      decoration: const InputDecoration(hintText: 'isCorrect'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await Dio().post(
                          'https://backenddictionary-production.up.railway.app/option',
                          data: {
                            "value": _optValue.text.toString().trim(),
                            "correct": _optCorrect.text.toString().trim()
                          },
                        );
                        setState(() {
                          _optValue.clear();
                          _optCorrect.clear();
                        });
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),

        const SizedBox(height: 20),
        //*Question
        FutureBuilder(
          future: Dio().get(
            'https://backenddictionary-production.up.railway.app/question',
          ),
          builder: (context, snapshot) {
            if (!(snapshot.connectionState == ConnectionState.waiting)) {
              return Container(
                decoration: AppContainerStyle.border,
                child: Column(
                  children: [
                    Text(
                      'Question',
                      style: AppTextStyle.bold35,
                    ),
                    TextField(
                      controller: _quesType,
                      decoration: const InputDecoration(hintText: 'type'),
                    ),
                    TextField(
                      controller: _quesTitle,
                      decoration: const InputDecoration(hintText: 'title'),
                    ),
                    TextField(
                      controller: _quesDes,
                      decoration:
                          const InputDecoration(hintText: 'description'),
                    ),
                    TextField(
                      controller: _quesAns,
                      decoration: const InputDecoration(hintText: 'answer'),
                    ),
                    TextField(
                      controller: _quesPoint,
                      decoration: const InputDecoration(hintText: 'point'),
                    ),
                    Container(
                      decoration: AppContainerStyle.border
                          .copyWith(color: AppColors.white),
                      child: Column(
                        children: [
                          TextField(
                            controller: _quesOptA,
                            decoration:
                                const InputDecoration(hintText: 'Option A Id '),
                          ),
                          TextField(
                            controller: _quesOptB,
                            decoration:
                                const InputDecoration(hintText: 'Option B Id '),
                          ),
                          TextField(
                            controller: _quesOptC,
                            decoration:
                                const InputDecoration(hintText: 'Option C Id '),
                          ),
                          TextField(
                            controller: _quesOptD,
                            decoration:
                                const InputDecoration(hintText: 'Option D Id '),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await Dio().post(
                          'https://backenddictionary-production.up.railway.app/question',
                          data: {
                            "type": _quesType.text.toString().trim(),
                            "title": _quesTitle.text.toString().trim(),
                            "description": _quesDes.text.toString().trim(),
                            "answer": _quesAns.text.toString().trim(),
                            "point": _quesPoint.text.toString().trim(),
                            "options": [
                              _quesOptA.text.toString().trim(),
                              _quesOptB.text.toString().trim(),
                              _quesOptC.text.toString().trim(),
                              _quesOptD.text.toString().trim()
                            ]
                          },
                        );
                        setState(() {
                          _quesType.clear();
                          _quesTitle.clear();
                          _quesDes.clear();
                          _quesAns.clear();
                          _quesPoint.clear();
                          _quesOptA.clear();
                          _quesOptB.clear();
                          _quesOptC.clear();
                          _quesOptD.clear();
                        });
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),

        const SizedBox(height: 20),
        //*Test
        FutureBuilder(
          future: Dio().get(
            'https://backenddictionary-production.up.railway.app/test',
          ),
          builder: (context, snapshot) {
            if (!(snapshot.connectionState == ConnectionState.waiting)) {
              return Container(
                decoration: AppContainerStyle.border,
                child: Column(
                  children: [
                    Text(
                      'Test',
                      style: AppTextStyle.bold35,
                    ),
                    TextField(
                      controller: _testName,
                      decoration: const InputDecoration(hintText: 'name'),
                    ),
                    TextField(
                      controller: _testImage,
                      decoration: const InputDecoration(hintText: 'Image'),
                    ),
                    Container(
                      decoration: AppContainerStyle.border
                          .copyWith(color: AppColors.white),
                      child: Column(
                        children: [
                          TextField(
                            controller: _testQues1,
                            decoration: const InputDecoration(
                                hintText: 'Question 1 Id'),
                          ),
                          TextField(
                            controller: _testQues2,
                            decoration: const InputDecoration(
                                hintText: 'Question 2 Id'),
                          ),
                          TextField(
                            controller: _testQues3,
                            decoration: const InputDecoration(
                                hintText: 'Question 3 Id'),
                          ),
                          TextField(
                            controller: _testQues4,
                            decoration: const InputDecoration(
                                hintText: 'Question 4 Id'),
                          ),
                          TextField(
                            controller: _testQues5,
                            decoration: const InputDecoration(
                                hintText: 'Question 5 Id'),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await Dio().post(
                          'https://backenddictionary-production.up.railway.app/test',
                          data: {
                            "name": _testName.text.toString().trim(),
                            "image": _testImage.text.toString().trim(),
                            "questions": [
                              _testQues1.text.toString().trim(),
                              _testQues2.text.toString().trim(),
                              _testQues3.text.toString().trim(),
                              _testQues4.text.toString().trim(),
                              _testQues5.text.toString().trim()
                            ]
                          },
                        );
                        setState(() {
                          _testName.clear();
                          _testImage.clear();
                          _testQues1.clear();
                          _testQues2.clear();
                          _testQues3.clear();
                          _testQues4.clear();
                          _testQues5.clear();
                        });
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }
}

//*Unit
class ManageUnit extends StatefulWidget {
  const ManageUnit({super.key});

  @override
  State<ManageUnit> createState() => _ManageUnitState();
}

class _ManageUnitState extends State<ManageUnit> {
  late TextEditingController _unitName;
  late TextEditingController _unitImage;

  late TextEditingController _unitId;
  late TextEditingController _vocaId;

  @override
  void initState() {
    _unitName = TextEditingController();
    _unitImage = TextEditingController();

    _unitId = TextEditingController();
    _vocaId = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _unitName.dispose();
    _unitImage.dispose();

    _unitId.dispose();
    _vocaId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: Dio().get(
            'https://backenddictionary-production.up.railway.app/unit',
          ),
          builder: (context, snapshot) {
            if (!(snapshot.connectionState == ConnectionState.waiting)) {
              return Container(
                decoration: AppContainerStyle.border.copyWith(
                  color: AppColors.lightGreen,
                ),
                child: Column(
                  children: [
                    Text(
                      'Unit',
                      style: AppTextStyle.bold35,
                    ),
                    TextField(
                      controller: _unitName,
                      decoration: const InputDecoration(hintText: 'name'),
                    ),
                    TextField(
                      controller: _unitImage,
                      decoration: const InputDecoration(hintText: 'image'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await Dio().post(
                          'https://backenddictionary-production.up.railway.app/unit',
                          data: {
                            "name": _unitName.text.toString().trim(),
                            "image": _unitImage.text.toString().trim(),
                          },
                        );
                        setState(() {
                          _unitName.clear();
                          _unitImage.clear();
                        });
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        const SizedBox(height: 20),
        FutureBuilder(
          future: Dio().get(
            'https://backenddictionary-production.up.railway.app/unithasvocabulary',
          ),
          builder: (context, snapshot) {
            if (!(snapshot.connectionState == ConnectionState.waiting)) {
              return Container(
                decoration: AppContainerStyle.border.copyWith(
                  color: AppColors.lightGreen,
                ),
                child: Column(
                  children: [
                    Text(
                      'Unit Has Vocabularies',
                      style: AppTextStyle.bold35,
                    ),
                    TextField(
                      controller: _unitId,
                      decoration: const InputDecoration(hintText: 'Unit Id'),
                    ),
                    TextField(
                      controller: _vocaId,
                      decoration:
                          const InputDecoration(hintText: 'Vocabulary Id'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await Dio().post(
                          'https://backenddictionary-production.up.railway.app/unithasvocabulary',
                          data: {
                            "unitId": _unitId.text.toString().trim(),
                            "vocabularyId": _vocaId.text.toString().trim(),
                          },
                        );
                        setState(() {
                          //_unitId.clear();
                          _vocaId.clear();
                        });
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }
}

//*Database screen
class DatabaseMange extends StatelessWidget {
  const DatabaseMange({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database manage'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          //ManageVocabulary(),
          SizedBox(height: 20),
          //ManageTest(),
          SizedBox(height: 20),
          ManageUnit(),
        ],
      ),
    );
  }
}
