import 'package:dictionary/res/themes.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AppAuthFieldType {
  email,
  password,
}

class AppAuthField extends StatefulWidget {
  final AppAuthFieldType layout;
  final String? hintText;
  final TextEditingController? controller;
  get isEmail => layout == AppAuthFieldType.email;
  get isPassword => layout == AppAuthFieldType.password;

  factory AppAuthField({
    required AppAuthFieldType layout,
    required String hintText,
    TextEditingController? controller,
  }) {
    return AppAuthField._internal(
      layout: layout,
      hintText: hintText,
      controller: controller,
    );
  }

  const AppAuthField._internal({
    required this.layout,
    required this.hintText,
    this.controller,
  });

  @override
  State<AppAuthField> createState() => _AppAuthFieldState();
}

class _AppAuthFieldState extends State<AppAuthField> {
  bool _obscureText = true;
  get isEmail => widget.layout == AppAuthFieldType.email;
  get isPassword => widget.layout == AppAuthFieldType.password;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.emailAddress,
        enableSuggestions: false,
        autocorrect: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: AppColors.black,
        style: AppTextStyle.medium15,
        validator: (widget.layout == AppAuthFieldType.email)
            ? (value) => value != null && !EmailValidator.validate(value)
                ? 'Enter a valid email'
                : null
            : (value) => value != null && value.length < 6
                ? 'Password must have at least 6 characters'
                : null,
        obscureText: (widget.layout == AppAuthFieldType.email)
            ? !_obscureText
            : _obscureText,
        decoration: InputDecoration(
          prefixIcon: (widget.layout == AppAuthFieldType.email)
              ? const Icon(
                  CupertinoIcons.mail,
                )
              : const Icon(
                  CupertinoIcons.lock,
                ),
          suffixIcon: (widget.layout == AppAuthFieldType.email)
              ? null
              : IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText
                        ? CupertinoIcons.eye_slash
                        : CupertinoIcons.eye,
                  ),
                ),
          filled: true,
          fillColor: AppColors.white,
          hintText: widget.hintText,
          hintStyle: AppTextStyle.regular15,
          prefixIconColor: AppColors.black,
          suffixIconColor: AppColors.black,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
            borderSide: const BorderSide(
              color: AppColors.black,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
            borderSide: const BorderSide(
              color: AppColors.black,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
