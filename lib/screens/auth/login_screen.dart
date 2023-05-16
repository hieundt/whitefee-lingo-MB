import 'package:dictionary/routes.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/data/services/user_service.dart';
import 'package:dictionary/res/images.dart';
import 'package:dictionary/res/themes.dart';
import 'package:dictionary/screens/auth/widgets/app_text_fields.dart';
import 'package:dictionary/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

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

  Future<void> selectBirthday() async {}

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
                              //Login logic

                              setState(() {
                                _email.clear();
                                _password.clear();
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
                          Navigator.of(context).pushReplacementNamed(
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
                    ],
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
