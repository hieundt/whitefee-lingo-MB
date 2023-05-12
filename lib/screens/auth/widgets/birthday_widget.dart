import 'package:dictionary/providers/auth_provider.dart';
import 'package:dictionary/res/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BirthdayWidget extends StatelessWidget {
  const BirthdayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthProvider>(context);

    Future<void> selectBirthday() async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (picked != null && picked != provider.birthday) {
        provider.birthday = picked;
      }
    }

    return Column(
      children: [
        Container(
          width: 300,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          decoration: AppContainerStyle.border.copyWith(
            color: AppColors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: selectBirthday,
                child: const Icon(
                  Icons.calendar_today,
                  size: 50,
                  color: AppColors.darkGray,
                ),
              ),
              const SizedBox(width: 20),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Birth day ',
                      style: AppTextStyle.regular15,
                    ),
                    TextSpan(
                      text: DateFormat("dd/MM/yyyy").format(provider.birthday),
                      style: AppTextStyle.medium15.copyWith(
                        color: AppColors.darkGreen,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
