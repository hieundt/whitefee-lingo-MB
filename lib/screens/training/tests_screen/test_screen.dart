import 'package:dictionary/data/models/test_models/question_model.dart';
import 'package:dictionary/data/services/training_service.dart';
import 'package:dictionary/res/images.dart';
import 'package:dictionary/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    final controller = PageController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
            future: TestService().getAllQuestionOfTest(test.id!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var questions = snapshot.data!;
                return PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  children: [
                    TestStartScreen(
                      test: test,
                      controller: controller,
                    ),
                    QuestionWidget(
                      question: questions[0],
                      controller: controller,
                    ),
                    QuestionWidget(
                      question: questions[1],
                      controller: controller,
                    ),
                    QuestionWidget(
                      question: questions[2],
                      controller: controller,
                    ),
                    QuestionWidget(
                      question: questions[3],
                      controller: controller,
                    ),
                    QuestionWidget(
                      question: questions[4],
                      controller: controller,
                    ),
                    TestCongratsScreen(test: test),
                  ],
                );
              } else {
                return const AppLoadingIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  final Question question;
  final PageController controller;
  const QuestionWidget({
    super.key,
    required this.question,
    required this.controller,
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
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          CupertinoIcons.xmark_circle,
                          color: AppColors.red,
                          size: 40,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        'Choose the correct answer',
                        style: AppTextStyle.bold15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                QuestionAudioWidget(url: question.title!),
                const SizedBox(height: 10),
                Expanded(
                  flex: 2,
                  child: Image(
                    image: NetworkImage(question.description!),
                  ),
                ),
                const SizedBox(height: 10),
                FutureBuilder(
                  future: TestService().getAllOptionOfQuestion(question.id!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      var options = snapshot.data!;
                      return Expanded(
                        flex: 2,
                        child: Column(
                          children: options.map((e) {
                            return Column(
                              children: [
                                OptionWidget(
                                  option: e,
                                  answer: question.answer!,
                                  controller: controller,
                                ),
                                const SizedBox(height: 15),
                              ],
                            );
                          }).toList(),
                        ),
                      );
                    } else {
                      return const AppLoadingIndicator();
                    }
                  },
                ),
              ]
            : [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          CupertinoIcons.xmark_circle,
                          color: AppColors.red,
                          size: 40,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        'Choose the correct answer',
                        style: AppTextStyle.bold15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    decoration: AppContainerStyle.border.copyWith(
                      color: AppColors.darkGreen,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      question.title!,
                      style: AppTextStyle.bold15.copyWith(
                        color: AppColors.white,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                FutureBuilder(
                  future: TestService().getAllOptionOfQuestion(question.id!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      var options = snapshot.data!;
                      return Expanded(
                        flex: 1,
                        child: Column(
                          children: options.map((e) {
                            return Column(
                              children: [
                                const SizedBox(height: 20),
                                OptionWidget(
                                  option: e,
                                  answer: question.answer!,
                                  controller: controller,
                                )
                              ],
                            );
                          }).toList(),
                        ),
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

class OptionWidget extends StatefulWidget {
  final Option option;
  final String answer;
  final PageController controller;
  const OptionWidget({
    super.key,
    required this.option,
    required this.answer,
    required this.controller,
  });

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  Color? color = AppColors.lightGray;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          width: 2,
          color: AppColors.black,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        focusColor: AppColors.black,
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          _buildBottomSheet(
            context: context,
            opt: widget.option,
            answer: widget.answer,
            controller: widget.controller,
          );
          //Neu goi provider trong option, sau khi select se bi reset lai trang dau
          //Ly do vi phai querry 2 lan de lay dc option
          //Giai phap hien tai la dung setState o nhung vi tri goi toi option
          setState(() {
            widget.option.correct == true
                ? color = AppColors.green
                : color = AppColors.red;
          });
        },
        child: ListTile(
          dense: true,
          leading: Text(
            widget.option.value!,
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
    required PageController controller,
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
                Text(
                  correct
                      ? 'Good Job! Keep going'
                      : 'Wrong! Try again next time',
                  style: AppTextStyle.medium15,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        correct ? AppColors.darkGreen : AppColors.red,
                  ),
                  child: Text(
                    'Next question',
                    style: AppTextStyle.bold15.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  onPressed: () async {
                    await controller.nextPage(
                      duration: const Duration(microseconds: 300),
                      curve: Curves.linear,
                    );
                    if (!mounted) return;
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

class TestStartScreen extends StatelessWidget {
  final Test test;
  final PageController controller;
  const TestStartScreen({
    super.key,
    required this.test,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "You're about to take the ${test.name} test",
            style: AppTextStyle.bold25,
          ),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              text: 'Each question can ',
              style: AppTextStyle.regular13,
              children: <TextSpan>[
                TextSpan(
                  text: 'only be answered once',
                  style: AppTextStyle.bold12.copyWith(
                    color: AppColors.darkRed,
                  ),
                ),
                TextSpan(
                  text: '!',
                  style: AppTextStyle.regular15,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Image(
              image: NetworkImage(test.image!),
            ),
          ),
          const Divider(),
          FloatingActionButton.extended(
            onPressed: () async {
              await controller.nextPage(
                duration: const Duration(microseconds: 300),
                curve: Curves.linear,
              );
            },
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
            style: AppTextStyle.bold25,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Divider(
            thickness: 3,
            color: AppColors.black,
          ),
          const SizedBox(height: 30),
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
