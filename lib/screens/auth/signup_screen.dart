import 'package:dictionary/data/services/user_service.dart';
import 'package:dictionary/providers/auth_provider.dart';
import 'package:dictionary/res/images.dart';
import 'package:dictionary/res/themes.dart';
import 'package:dictionary/screens/auth/widgets/app_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'widgets/birthday_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var birthday = Provider.of<AuthProvider>(context).birthday;
    return Scaffold(
      //appBar: AppBar(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppLogoImage.logo,
                        height: 50,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Create your account',
                        style: AppTextStyle.bold25,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    controller: _email,
                    hint: 'Enter email',
                    validator: AppTextFieldType.email,
                  ),
                  const SizedBox(height: 20),
                  AppPasswordField(
                    hint: 'Enter password',
                    controller: _password,
                  ),
                  const SizedBox(height: 20),
                  AppPasswordField(
                    hint: 'Enter confirm password',
                    controller: _confirmPassword,
                    confirmController: _password,
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    controller: _userName,
                    hint: 'Enter user name',
                    validator: AppTextFieldType.name,
                  ),
                  const SizedBox(height: 20),
                  const BirthdayWidget(),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: AppButtonStyle.boder,
                    child: Text(
                      'Create account',
                      style: AppTextStyle.medium20.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      UserService().createAccount(
                        email: _email.text.toString().trim(),
                        password: _password.text.toString().trim(),
                        userName: _userName.text.toString().trim(),
                        dateOfBirth: birthday,
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Already have an acount? ',
                            style: AppTextStyle.regular13,
                          ),
                          TextSpan(
                            text: 'Sign in here',
                            style: AppTextStyle.bold15.copyWith(
                              color: AppColors.darkGreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    _userName.dispose();

    super.dispose();
  }
}
