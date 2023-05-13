import 'package:dictionary/data/models/test_models/question_model.dart';
import 'package:dictionary/data/services/training_service.dart';
import 'package:dictionary/providers/test_provider.dart';
import 'package:dictionary/res/images.dart';
import 'package:dictionary/screens/training/widgets/animated_progress_bar.dart';
import 'package:dictionary/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/models/test_models/option_model.dart';
import '../../../data/models/test_models/test_model.dart';
import '../../../res/themes.dart';
import '../widgets/question_audio_widget.dart';

class TestScreen extends StatelessWidget {
  final Test test;
  const TestScreen({
    super.key,
    required this.test,
  });

  @override
  Widget build(BuildContext context) {
    var testState = Provider.of<TestProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            CupertinoIcons.arrow_left_circle_fill,
            color: AppColors.red,
            size: 40,
          ),
        ),
        title: AppAnimatedProgressbar(value: testState.progress),
        elevation: 0,
        backgroundColor: AppColors.transparent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: TestService().getAllQuestionOfTest(test.id!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var questions = snapshot.data!;
              return PageView.builder(
                //physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller: testState.controller,
                onPageChanged: (int index) {
                  testState.progress = (index / (questions.length + 1));
                },
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return TestTutorialScreen(test: test);
                  } else if (index == questions.length + 1) {
                    return TestCongratsScreen(test: test);
                  } else {
                    return QuestionWidget(question: questions[index - 1]);
                  }
                },
              );
            } else {
              return const AppLoadingIndicator();
            }
          },
        ),
        //),
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  final Question question;
  const QuestionWidget({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: AppContainerStyle.border.copyWith(
        color: AppColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: question.type!
            ? [
                Text(
                  'Choose the correct answer',
                  style: AppTextStyle.bold15,
                ),
                const SizedBox(height: 10),
                QuestionAudioWidget(url: question.title!),
                const SizedBox(height: 10),
                Expanded(
                  flex: 2,
                  child: Image.network(
                    question.description!,
                  ),
                ),
                const SizedBox(height: 10),
                // FutureBuilder(
                //   future: TestService().getAllOptionOfQuestion(question.id!),
                //   builder: (context, snapshot) {
                //     if (snapshot.connectionState == ConnectionState.done) {
                //       var options = snapshot.data!;
                //       return Expanded(
                //         flex: 3,
                //         child: Column(
                //           children: options.map((e) {
                //             return Column(
                //               children: [
                //                 OptionWidget(
                //                   option: e,
                //                   answer: question.answer!,
                //                 ),
                //                 const SizedBox(height: 15),
                //               ],
                //             );
                //           }).toList(),
                //         ),
                //       );
                //     } else {
                //       return const AppLoadingIndicator();
                //     }
                //   },
                // ),
              ]
            : [
                Text(
                  'Choose the correct answer',
                  style: AppTextStyle.bold15,
                ),
                const SizedBox(height: 20),
                Container(
                  height: 200,
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: AppContainerStyle.border.copyWith(
                    color: AppColors.darkGreen,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    question.title!,
                    style: AppTextStyle.bold12.copyWith(
                      color: AppColors.white,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ),
                const SizedBox(height: 20),
                FutureBuilder(
                  future: TestService().getAllOptionOfQuestion(question.id!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      var options = snapshot.data!;
                      return Column(
                        children: options.map((e) {
                          return Column(
                            children: [
                              const SizedBox(height: 20),
                              OptionWidget(
                                option: e,
                                answer: question.answer!,
                              )
                            ],
                          );
                        }).toList(),
                      );
                    } else {
                      return const AppLoadingIndicator();
                    }
                  },
                ),
              ],
      ),
    );
  }
}

class OptionWidget extends StatelessWidget {
  final Option option;
  final String answer;
  const OptionWidget({
    super.key,
    required this.option,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    var optionState = Provider.of<TestProvider>(context);

    return Material(
      color: AppColors.lightGray,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          width: 2,
          color: AppColors.black,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          optionState.selected = option;
          _buildBottomSheet(
            context: context,
            opt: option,
            answer: answer,
            provider: optionState,
          );
        },
        splashColor: AppColors.gray,
        child: ListTile(
          dense: true,
          leading: Text(
            option.value!,
            style: AppTextStyle.medium15,
          ),
          minLeadingWidth: 0,
        ),
      ),
    );
  }

  _buildBottomSheet({
    required BuildContext context,
    required Option opt,
    required String answer,
    required TestProvider provider,
  }) {
    bool correct = opt.correct ?? false;
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(correct ? 'Good Job!' : answer),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        correct ? AppColors.darkGreen : AppColors.red,
                  ),
                  child: Text(
                    correct ? 'Keep going!' : 'Practice makes perfect',
                    style: const TextStyle(
                      color: AppColors.white,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    provider.nextPage();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TestTutorialScreen extends StatelessWidget {
  final Test test;
  const TestTutorialScreen({
    super.key,
    required this.test,
  });

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<TestProvider>(context);

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'You re about to take the ${test.name} test',
            style: AppTextStyle.medium20,
          ),
          Expanded(
            child: Image(
              image: NetworkImage(test.image!),
            ),
          ),
          const Divider(),
          FloatingActionButton.extended(
            onPressed: state.nextPage,
            icon: const Icon(Icons.poll),
            label: Text(
              'Start',
              style: AppTextStyle.medium40,
            ),
          )
        ],
      ),
    );
  }
}

class TestCongratsScreen extends StatelessWidget {
  final Test test;
  const TestCongratsScreen({
    super.key,
    required this.test,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Congrats! You completed the ${test.name} test',
            textAlign: TextAlign.center,
          ),
          const Divider(),
          Image.asset(
            AppLogoImage.logo,
            fit: BoxFit.cover,
            scale: 2,
          ),
          const Divider(),
          ElevatedButton.icon(
            style: AppButtonStyle.boder,
            icon: const Icon(CupertinoIcons.checkmark_circle),
            label: const Text(' Mark Complete!'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
