import 'package:flutter/material.dart';
import 'res/themes.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
        strokeWidth: 4.0,
        backgroundColor: AppColors.gray,
      ),
    );
  }
}

Future<void> errorDialog(
  BuildContext context,
  String error,
) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Something went wrong'),
        content: Text(error),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Got it!'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          // TextButton(
          //   style: TextButton.styleFrom(
          //     textStyle: Theme.of(context).textTheme.labelLarge,
          //   ),
          //   child: const Text('Enable'),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
        ],
      );
    },
  );
}
