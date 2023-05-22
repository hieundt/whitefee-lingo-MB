import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/services/user_service.dart';
import '../../res/themes.dart';
import '../../routes.dart';
import '../../utils.dart';
import 'widgets/app_text_fields.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _email;
  late TextEditingController _password;
  late TextEditingController _confirmPassword;
  late TextEditingController _userName;
  var birthday = DateTime.now();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _confirmPassword = TextEditingController();
    _userName = TextEditingController();
    super.initState();
  }

  Future<void> selectBirthday() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != birthday) {
      setState(() {
        birthday = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create your account here',
                style: AppTextStyle.bold35.copyWith(
                  color: AppColors.darkGreen,
                ),
                softWrap: true,
                overflow: TextOverflow.clip,
              ),
              const SizedBox(height: 10),
              Text(
                'Please provide your information below',
                style: AppTextStyle.medium15.copyWith(
                  color: AppColors.black,
                ),
                softWrap: true,
                overflow: TextOverflow.clip,
              ),
            ],
          ),
          backgroundColor: AppColors.transparent,
          toolbarHeight: 150.0,
        ),
        body: FutureBuilder(
          future: UserService().getAllUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        AppTextField(
                          controller: _email,
                          hint: 'Enter email',
                          validator: AppTextFieldType.email,
                        ),
                        const SizedBox(height: 10),
                        AppPasswordField(
                          hint: 'Enter password',
                          controller: _password,
                        ),
                        const SizedBox(height: 10),
                        AppPasswordField(
                          hint: 'Enter confirm password',
                          controller: _confirmPassword,
                          confirmController: _password,
                        ),
                        const SizedBox(height: 10),
                        AppTextField(
                          controller: _userName,
                          hint: 'Enter user name',
                          validator: AppTextFieldType.name,
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: selectBirthday,
                          child: Container(
                            padding: const EdgeInsets.only(
                              right: 10,
                              left: 20,
                            ),
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            height: 57,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: AppColors.black,
                              ),
                            ),
                            child: Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Birthday ',
                                        style: AppTextStyle.regular15,
                                      ),
                                      TextSpan(
                                        text: DateFormat("dd/MM/yyyy")
                                            .format(birthday),
                                        style: AppTextStyle.bold15.copyWith(
                                          color: AppColors.darkGreen,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  CupertinoIcons.calendar,
                                  size: 35,
                                  color: AppColors.darkGreen,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox.fromSize(
                          size: const Size(210, 70),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await UserService().createAccount(
                                  email: _email.text.toString().trim(),
                                  password: _password.text.toString().trim(),
                                  userName: _userName.text.toString().trim(),
                                  dateOfBirth: birthday.toIso8601String(),
                                );
                                if (!mounted) return;
                                appMessageDialog(
                                  context: context,
                                  title: 'Welcome! new user',
                                  message: 'Your account has been created',
                                ).then((_) {
                                  Navigator.of(context).pop();
                                });

                                setState(() {
                                  _email.clear();
                                  _password.clear();
                                  _confirmPassword.clear();
                                  _userName.clear();
                                  birthday = DateTime.now();
                                });
                              } else {
                                appMessageDialog(
                                  context: context,
                                  title: 'Error',
                                  message: 'Please correct the information',
                                );
                              }
                            },
                            style: AppButtonStyle.boder.copyWith(
                              backgroundColor: const MaterialStatePropertyAll(
                                AppColors.darkGreen,
                              ),
                            ),
                            child: Text(
                              'Create account',
                              style: AppTextStyle.medium20.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Already have an acount? ',
                                  style: AppTextStyle.regular13,
                                ),
                                TextSpan(
                                  text: 'Login here',
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
              );
            } else {
              return const AppLoadingIndicator();
            }
          },
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
