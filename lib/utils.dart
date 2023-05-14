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

Future<void> appMessageDialog(
  BuildContext context,
  String message,
) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Comming soon',
          style: AppTextStyle.bold15,
        ),
        content: Text(
          message,
          style: AppTextStyle.regular13,
        ),
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
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );
    },
  );
}
