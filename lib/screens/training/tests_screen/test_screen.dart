import 'package:dictionary/data/models/test_models/question_model.dart';
import 'package:dictionary/data/services/training_service.dart';
import 'package:dictionary/providers/test_provider.dart';
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
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: AppContainerStyle.border.copyWith(
            color: AppColors.white,
          ),
          child: FutureBuilder(
            future: TestService().getAllQuestionOfTest(test.id!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var questions = snapshot.data!;
                //var ques = questions[0];
                return PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: testState.controller,
                  onPageChanged: (int index) =>
                      testState.progress = (index / (test.questions!.length)),
                  itemBuilder: (context, index) {
                    return QuestionWidget(question: questions[index]);
                  },
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
  const QuestionWidget({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: question.type!
          ? [
              Text(
                'Choose the correct answer',
                style: AppTextStyle.bold15,
              ),
              const SizedBox(height: 20),
              QuestionAudioWidget(url: question.title!),
              Image.network(
                question.description!,
                height: 250,
              ),
              const SizedBox(height: 10),
              FutureBuilder(
                future: TestService().getAllOptionOfQuestion(question.id!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    var options = snapshot.data!;
                    return Column(
                      children: options.map((e) {
                        return Column(
                          children: [
                            OptionWidget(option: e),
                            const SizedBox(height: 15),
                          ],
                        );
                      }).toList(),
                    );
                  } else {
                    return const AppLoadingIndicator();
                  }
                },
              ),
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
                            OptionWidget(option: e)
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
    );
  }
}

class OptionWidget extends StatelessWidget {
  final Option option;
  const OptionWidget({
    super.key,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    var optionState = Provider.of<TestProvider>(context);
    return GestureDetector(
      onTap: () {
        optionState.selected = option;
      },
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: AppContainerStyle.border.copyWith(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Text(
                option.value!,
                style: AppTextStyle.medium13,
              ),
            ),
            Expanded(
              flex: 1,
              child: Icon(
                optionState.selected == option
                    ? (option.correct == true
                        ? CupertinoIcons.checkmark_circle_fill
                        : CupertinoIcons.xmark_circle_fill)
                    : CupertinoIcons.circle,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}





// class TestScreen extends StatefulWidget {
//   final Test test;
//   const TestScreen({
//     super.key,
//     required this.test,
//   });

//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }

// class _TestScreenState extends State<TestScreen> {
//   late final memoizer;

//   @override
//   void initState() {
//     memoizer = AsyncMemoizer();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     _fetchData() async {
//       return memoizer.runOnce(() async {
//         return await TestService().getAllQuestionOfTest(widget.test.id!);
//       });
//     }

//     return FutureBuilder(
//       future: _fetchData(),
//       builder: (context, snapshot) {
//         var state = Provider.of<TestProvider>(context);
//         if (snapshot.connectionState == ConnectionState.done) {
//           var questions = snapshot.data!;
//           return Scaffold(
//             appBar: AppBar(
//                 // title: AppAnimatedProgressbar(value: state.progress),
//                 // leading: IconButton(
//                 //   icon: const Icon(CupertinoIcons.xmark),
//                 //   onPressed: () => Navigator.pop(context),
//                 // ),
//                 ),
//             body: PageView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               scrollDirection: Axis.vertical,
//               controller: state.controller,
//               onPageChanged: (int index) => state.progress =
//                   (index / (widget.test.questions!.length + 1)),
//               itemBuilder: (BuildContext context, int index) {
//                 if (index == 0) {
//                   return TestTutorialScreen(test: widget.test);
//                 } else if (index == widget.test.questions!.length + 1) {
//                   return TestCongratsView(test: widget.test);
//                 } else {
//                   return QuestionScreen(question: questions[index - 1]);
//                   //return const Placeholder();
//                 }
//               },
//             ),
//           );
//         } else {
//           return Scaffold(
//             appBar: AppBar(
//               elevation: 0,
//               backgroundColor: AppColors.transparent,
//             ),
//             body: Center(
//               child: Column(
//                 children: [
//                   Text(
//                     'Just a second...',
//                     style: AppTextStyle.medium25,
//                   ),
//                   const SizedBox(height: 20),
//                   const AppLoadingIndicator(),
//                 ],
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }
// }

// class TestTutorialScreen extends StatelessWidget {
//   final Test test;
//   const TestTutorialScreen({
//     super.key,
//     required this.test,
//   });

//   @override
//   Widget build(BuildContext context) {
//     var state = Provider.of<TestProvider>(context);

//     return Container(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // Expanded(
//           //   child: Image(
//           //     image: NetworkImage(test.tutorial),
//           //   ),
//           // ),
//           const Divider(),
//           FloatingActionButton.extended(
//             onPressed: state.nextPage,
//             icon: const Icon(Icons.poll),
//             label: Text(
//               'Start',
//               style: AppTextStyle.medium40,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class TestCongratsView extends StatelessWidget {
//   final Test test;
//   const TestCongratsView({
//     super.key,
//     required this.test,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'Congrats! You completed the ${test.name} test',
//             textAlign: TextAlign.center,
//           ),
//           const Divider(),
//           // Image.asset(
//           //   AppLogo.myEnglishPalLogo,
//           //   fit: BoxFit.cover,
//           //   scale: 2,
//           // ),
//           const Divider(),
//           ElevatedButton.icon(
//             style: AppButtonStyle.boder,
//             icon: const Icon(CupertinoIcons.checkmark_circle),
//             label: const Text(' Mark Complete!'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           )
//         ],
//       ),
//     );
//   }
// }

// class QuestionScreen extends StatefulWidget {
//   final Question question;
//   const QuestionScreen({
//     super.key,
//     required this.question,
//   });

//   @override
//   State<QuestionScreen> createState() => _QuestionScreenState();
// }

// class _QuestionScreenState extends State<QuestionScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: TestService().getAllOptionOfQuestion(widget.question.id!),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           var state = Provider.of<TestProvider>(context);
//           var options = snapshot.data!;
//           return Column(
//             children: [
//               const SizedBox(
//                 //child: TrainingQuizAudio(url: question.title!),
//                 child: Text('Title'),
//               ),
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 alignment: Alignment.center,
//                 child: Image(
//                   image: NetworkImage(
//                     widget.question.description!,
//                     scale: 0.5,
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: options.map(
//                     (option) {
//                       return Container(
//                         height: 60,
//                         margin: const EdgeInsets.only(bottom: 10),
//                         decoration: AppContainerStyle.border.copyWith(
//                           color: AppColors.white,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: InkWell(
//                           onTap: () {
//                             state.selected = option;
//                             _bottomSheet(context, option, state);
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.all(16),
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   state.selected == option
//                                       ? (option.correct == true
//                                           ? CupertinoIcons.checkmark_circle_fill
//                                           : CupertinoIcons.xmark_circle_fill)
//                                       : CupertinoIcons.circle,
//                                   size: 30,
//                                 ),
//                                 Expanded(
//                                   child: Container(
//                                     margin: const EdgeInsets.only(left: 16),
//                                     child: Text(
//                                       option.value!,
//                                       //style: Theme.of(context).textTheme.bodyText2,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ).toList(),
//                 ),
//               ),
//             ],
//           );
//         } else {
//           return const AppLoadingIndicator();
//         }
//       },
//     );
//   }

//   /// Bottom sheet shown when Question is answered
//   _bottomSheet(BuildContext context, Option opt, TestProvider provider) {
//     bool correct = opt.correct ?? false;

//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           height: 250,
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(correct ? 'Good Job!' : 'Wrong'),
//               // Text(
//               //   opt.answer!,
//               //   style: const TextStyle(
//               //     fontSize: 18,
//               //     color: AppColors.blackColor,
//               //   ),
//               // ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor:
//                       correct ? AppColors.darkGreen : AppColors.red,
//                 ),
//                 child: Text(
//                   correct ? 'Onward!' : 'Try Again',
//                   style: const TextStyle(
//                     color: AppColors.white,
//                     letterSpacing: 1.5,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 onPressed: () {
//                   if (correct) {
//                     provider.nextPage();
//                   }
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
