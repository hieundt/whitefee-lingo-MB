// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/services/user_service.dart';
import '../../main.dart';
import '../../providers/user_provider.dart';
import '../../res/images.dart';
import '../../res/themes.dart';
import '../../routes.dart';
import '../../utils.dart';
import 'widgets/app_text_fields.dart';

class LoginScreen extends StatefulWidget {
  final bool? enableSkip;
  const LoginScreen({
    super.key,
    this.enableSkip = true,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _email;
  late TextEditingController _password;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(UserService.currentUserId);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login to your account',
                style: AppTextStyle.bold35.copyWith(
                  color: AppColors.darkGreen,
                ),
                softWrap: true,
                overflow: TextOverflow.clip,
              ),
              const SizedBox(height: 10),
              Text(
                'Welcome back!',
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox.fromSize(
                          size: const Size(100, 100),
                          child: Image.asset(
                            AppLogoImage.logo,
                          ),
                        ),
                        const SizedBox(height: 20),
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
                        const SizedBox(height: 20),
                        SizedBox.fromSize(
                          size: const Size(210, 70),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final currentUser =
                                    await UserService().loginWithEmailPassword(
                                  email: _email.text.toString(),
                                  password: _password.text.toString(),
                                );
                                if (currentUser != null) {
                                  await prefs.setString(
                                      'userId', currentUser.id!);
                                  //if (!mounted) return;
                                  Navigator.of(context).pushReplacementNamed(
                                    AppRoutes.home,
                                  );
                                  setState(() {
                                    _email.clear();
                                    _password.clear();
                                  });
                                } else {
                                  if (!mounted) return;
                                  appMessageDialog(
                                    context: context,
                                    title: 'User not found!',
                                    message:
                                        'Your information might be uncorrect',
                                  );
                                }
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
                              'Login',
                              style: AppTextStyle.medium20.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.signup,
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Don\'t have an acount? ',
                                  style: AppTextStyle.regular13,
                                ),
                                TextSpan(
                                  text: 'Create here',
                                  style: AppTextStyle.bold15.copyWith(
                                    color: AppColors.darkGreen,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        widget.enableSkip == false
                            ? const SizedBox.shrink()
                            : TextButton(
                                onPressed: () {
                                  if (!mounted) return;
                                  Navigator.of(context).pushReplacementNamed(
                                    AppRoutes.home,
                                  );
                                },
                                child: Text(
                                  'Skip for now',
                                  style: AppTextStyle.medium20.copyWith(
                                    color: AppColors.gray,
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
    super.dispose();
  }
}
