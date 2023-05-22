import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          return 'enter valid email';
        } else if (validator == AppTextFieldType.name && value!.isEmpty) {
          return 'enter valid name';
        }
        return null;
      },
      decoration: InputDecoration(
        hintStyle: AppTextStyle.medium13.copyWith(
          color: AppColors.darkGrey,
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

class AppPasswordField extends StatefulWidget {
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
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _hidePassword = true;

  void showPassword() {
    _hidePassword = !_hidePassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _hidePassword,
      style: AppTextStyle.regular15,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (widget.confirmController != null &&
                widget.confirmController!.text.toString() !=
                    widget.controller.text.toString() ||
            widget.confirmController != null && value!.isEmpty) {
          return 'enter valid confirm password';
        }

        if (value!.isEmpty && widget.confirmController == null) {
          return 'enter valid password';
        }
        return null;
      },
      decoration: InputDecoration(
        hintStyle: AppTextStyle.medium13.copyWith(
          color: AppColors.darkGrey,
        ),
        hintText: widget.hint,
        errorText: widget.error,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              showPassword();
            });
          },
          splashColor: Colors.transparent,
          icon: Icon(
            _hidePassword ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
            size: 20,
            color: AppColors.darkGrey,
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
