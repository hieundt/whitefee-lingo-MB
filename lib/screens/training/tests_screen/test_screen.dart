import 'package:dictionary/data/models/test_models/question_model.dart';
import 'package:dictionary/data/services/training_service.dart';
import 'package:dictionary/providers/test_provider.dart';
import 'package:dictionary/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/test_models/test_model.dart';
import '../../../res/themes.dart';
import '../widgets/animated.dart';

class TestScreen extends StatelessWidget {
  final Test test;
  const TestScreen({
    super.key,
    required this.test,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TestService().getTestById(test.id!),
      builder: (context, snapshot) {
        var state = Provider.of<TestProvider>(context);
        if (snapshot.connectionState == ConnectionState.done) {
          var test = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: AppAnimatedProgressbar(value: state.progress),
              leading: IconButton(
                icon: const Icon(CupertinoIcons.xmark),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              controller: state.controller,
              onPageChanged: (int idx) =>
                  state.progress = (idx / (test.questions!.length + 1)),
              itemBuilder: (BuildContext context, int idx) {
                if (idx == 0) {
                  return TestTutorialScreen(test: test);
                } else if (idx == test.questions!.length + 1) {
                  return TestCongratsView(test: test);
                } else {
                  //return QuestionScreen(question: test.questions![idx - 1]);
                  return const Placeholder();
                }
              },
            ),
          );
        } else {
          return const AppLoadingIndicator();
        }
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
          // Expanded(
          //   child: Image(
          //     image: NetworkImage(test.tutorial),
          //   ),
          // ),
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

class TestCongratsView extends StatelessWidget {
  final Test test;
  const TestCongratsView({
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
          // Image.asset(
          //   AppLogo.myEnglishPalLogo,
          //   fit: BoxFit.cover,
          //   scale: 2,
          // ),
          const Divider(),
          ElevatedButton.icon(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.darkGreen,
            ),
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

// class QuestionScreen extends StatelessWidget {
//   final Question question;
//   const QuestionScreen({
//     super.key,
//     required this.question,
//   });

//   @override
//   Widget build(BuildContext context) {
//     var state = Provider.of<TestProvider>(context);

//     return Column(
//       children: [
//         const SizedBox(
//           //child: TrainingQuizAudio(url: question.title!),
//           child: Text('Title'),
//         ),
//         Container(
//           padding: const EdgeInsets.all(16),
//           alignment: Alignment.center,
//           child: Image(
//             image: NetworkImage(
//               question.description!,
//               scale: 0.5,
//             ),
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: question.options!.map(
//               (opt) {
//                 return Container(
//                   height: 60,
//                   margin: const EdgeInsets.only(bottom: 10),
//                   color: AppColors.base,
//                   child: InkWell(
//                     onTap: () {
//                       state.selected = opt;
//                       _bottomSheet(context, opt, state);
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.all(16),
//                       child: Row(
//                         children: [
//                           Icon(
//                             state.selected == opt
//                                 ? (opt.isCorrect == true
//                                     ? CupertinoIcons.checkmark_circle_fill
//                                     : CupertinoIcons.xmark_circle_fill)
//                                 : CupertinoIcons.circle,
//                             size: 30,
//                           ),
//                           Expanded(
//                             child: Container(
//                               margin: const EdgeInsets.only(left: 16),
//                               child: Text(
//                                 opt.value!,
//                                 //style: Theme.of(context).textTheme.bodyText2,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ).toList(),
//           ),
//         ),
//       ],
//     );
//   }

//   /// Bottom sheet shown when Question is answered
//   _bottomSheet(BuildContext context, Option opt, TestProvider provider) {
//     bool correct = opt.isCorrect!;

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
