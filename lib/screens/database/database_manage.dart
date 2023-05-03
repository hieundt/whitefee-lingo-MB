import 'package:dictionary/themes/themes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {}

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
    return Column(
      children: [
        //*Option
        Container(
          decoration: AppContainerStyle.border,
          child: Column(
            children: [
              Text(
                'Option',
                style: AppTextStyle.bold35,
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'Option Id'),
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'value'),
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'isCorrect'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        //*Question
        Container(
          decoration: AppContainerStyle.border,
          child: Column(
            children: [
              Text(
                'Question',
                style: AppTextStyle.bold35,
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'Question id'),
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'type'),
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'title'),
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'description'),
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'answer'),
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'point'),
              ),
              Container(
                decoration:
                    AppContainerStyle.border.copyWith(color: AppColors.white),
                child: Column(
                  children: const [
                    TextField(
                      decoration: InputDecoration(hintText: 'Option A Id '),
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'Option B Id '),
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'Option C Id '),
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'Option D Id '),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        //*Test
        Container(
          decoration: AppContainerStyle.border,
          child: Column(
            children: [
              Text(
                'Test',
                style: AppTextStyle.bold35,
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'Test id'),
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'name'),
              ),
              const TextField(
                decoration:
                    InputDecoration(hintText: 'Unit Has Vocabulary Id '),
              ),
              Container(
                decoration:
                    AppContainerStyle.border.copyWith(color: AppColors.white),
                child: Column(
                  children: const [
                    TextField(
                      decoration: InputDecoration(hintText: 'Question 1 Id'),
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'Question 2 Id'),
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'Question 3 Id'),
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'Question 4 Id'),
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'Question 5 Id'),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//*Unit
class ManageUnit extends StatelessWidget {
  const ManageUnit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: AppContainerStyle.border.copyWith(
            color: AppColors.lightGreen,
          ),
          child: Column(
            children: [
              Text(
                'Unit',
                style: AppTextStyle.bold35,
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'Question 1 Id'),
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'name'),
              ),
              const TextField(
                decoration:
                    InputDecoration(hintText: 'Unit Has Vocabulary Id '),
              ),
              Container(
                decoration: AppContainerStyle.border.copyWith(
                  color: AppColors.white,
                ),
                child: Column(
                  children: const [
                    TextField(
                      decoration:
                          InputDecoration(hintText: 'Unit Has Vocabulary Id 1'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(hintText: 'Unit Has Vocabulary Id 2'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(hintText: 'Unit Has Vocabulary Id 3'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(hintText: 'Unit Has Vocabulary Id 4'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(hintText: 'Unit Has Vocabulary Id 5'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(hintText: 'Unit Has Vocabulary Id 6'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(hintText: 'Unit Has Vocabulary Id 7'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(hintText: 'Unit Has Vocabulary Id 8'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(hintText: 'Unit Has Vocabulary Id 9'),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Unit Has Vocabulary Id 10'),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: AppContainerStyle.border.copyWith(
            color: AppColors.lightGreen,
          ),
          child: Column(
            children: [
              Text(
                'Unit Has Vocabularies',
                style: AppTextStyle.bold35,
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'Id'),
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'Unit Id'),
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'Vocabulary Id'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add'),
              ),
            ],
          ),
        )
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
          ManageVocabulary(),
          SizedBox(height: 20),
          ManageTest(),
          SizedBox(height: 20),
          ManageUnit(),
        ],
      ),
    );
  }
}
