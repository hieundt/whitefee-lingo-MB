import 'package:dictionary/providers/test_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/models/test_models/option_model.dart';
import '../../../data/models/test_models/question_model.dart';
import '../../../data/models/test_models/test_model.dart';
import '../../../data/services/training_service.dart';
import '../../../data/services/user_service.dart';
import '../../../providers/user_provider.dart';
import '../../../res/images.dart';
import '../../../res/themes.dart';
import '../../../utils.dart';
import '../widgets/test_question_audio_widget.dart';

// In this situation can't use page controller of the provider
// Becasue when we interact with Option widget,
// the controller will reset page index to 0
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
                    TestCongratsScreen(
                      test: test,
                    ),
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
                                  point: question.point!,
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
                                  point: question.point!,
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
  final int point;
  final PageController controller;
  const OptionWidget({
    super.key,
    required this.option,
    required this.answer,
    required this.controller,
    required this.point,
  });

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  Color? color = AppColors.lightGrey;
  @override
  Widget build(BuildContext context) {
    var testProvider = Provider.of<TestProvider>(context);
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
          testProvider.selected = widget.option;
          _buildBottomSheet(
            context: context,
            opt: widget.option,
            answer: widget.answer,
            controller: widget.controller,
          );
          testProvider.selected == widget.option
              ? (testProvider.selected!.correct == true
                  ? color = AppColors.green
                  : color = AppColors.red)
              : color = AppColors.lightGrey;

          if (widget.option.correct == true) {
            testProvider.addPoint(widget.point);
          }
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
      isDismissible: false,
      enableDrag: false,
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
                  onPressed: () {
                    controller.nextPage(
                      duration: const Duration(microseconds: 300),
                      curve: Curves.linear,
                    );
                    //if (!mounted) return;
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
            onPressed: () {
              controller.nextPage(
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

class TestCongratsScreen extends StatefulWidget {
  final Test test;
  const TestCongratsScreen({
    super.key,
    required this.test,
  });

  @override
  State<TestCongratsScreen> createState() => _TestCongratsScreenState();
}

class _TestCongratsScreenState extends State<TestCongratsScreen> {
  @override
  Widget build(BuildContext context) {
    //var userProvider = Provider.of<UserProvider>(context);
    var testProvider = Provider.of<TestProvider>(context);

    return FutureBuilder(
      future:
          UserHistoryService().getTestHistoryOfUser(UserService.currentUserId!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Congrats! You completed the ${widget.test.name} test',
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
                  onPressed: () async {
                    await UserHistoryService().createTestHistory(
                      userId: UserService.currentUserId,
                      testId: widget.test.id,
                      totalPoint: testProvider.totalPoint,
                      testDate: DateTime.now().toIso8601String(),
                    );
                    testProvider.resetPoint();
                    if (!mounted) return;
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        } else {
          return const AppLoadingIndicator();
        }
      },
    );
  }
}
