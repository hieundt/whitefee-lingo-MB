import 'package:dictionary/providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../res/themes.dart';

enum AppTextFieldType {
  email,
  name,
}

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final AppTextFieldType validator;
  final TextInputType? inputType;
  final TextCapitalization textCapitalization;
  final String? error;

  const AppTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.validator,
    this.inputType,
    this.textCapitalization = TextCapitalization.none,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: AppTextStyle.regular15,
      keyboardType: inputType,
      textCapitalization: textCapitalization,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (validator == AppTextFieldType.email &&
            (value!.isEmpty ||
                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value))) {
          return 'enter_valid_email';
        } else if (validator == AppTextFieldType.name && value!.isEmpty) {
          return 'enter_valid_name';
        }
        return null;
      },
      decoration: InputDecoration(
        hintStyle: AppTextStyle.medium13.copyWith(
          color: AppColors.darkGray,
        ),
        hintText: hint,
        errorText: error,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
          borderSide: const BorderSide(
            color: AppColors.black,
            width: 3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
          borderSide: const BorderSide(
            color: AppColors.black,
            width: 3,
          ),
        ),
      ),
    );
  }
}

class AppPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextEditingController? confirmController;
  final String? error;
  const AppPasswordField({
    super.key,
    required this.controller,
    required this.hint,
    this.confirmController,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthProvider>(context);
    return TextFormField(
      controller: controller,
      obscureText: provider.hidePassword,
      style: AppTextStyle.regular15,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (confirmController != null &&
                confirmController!.text.toString() !=
                    controller.text.toString() ||
            confirmController != null && value!.isEmpty) {
          return 'enter valid confirm password';
        }

        if (value!.isEmpty && confirmController == null) {
          return 'enter valid password';
        }
        return null;
      },
      decoration: InputDecoration(
        hintStyle: AppTextStyle.medium13.copyWith(
          color: AppColors.darkGray,
        ),
        hintText: hint,
        errorText: error,
        suffixIcon: IconButton(
          onPressed: () {
            provider.showPassword();
          },
          splashColor: Colors.transparent,
          icon: Icon(
            provider.hidePassword
                ? CupertinoIcons.eye
                : CupertinoIcons.eye_slash,
            size: 20,
            color: AppColors.darkGray,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
          borderSide: const BorderSide(
            color: AppColors.black,
            width: 3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
          borderSide: const BorderSide(
            color: AppColors.black,
            width: 3,
          ),
        ),
      ),
    );
  }
}
