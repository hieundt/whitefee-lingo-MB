// ignore_for_file: use_build_context_synchronously

import 'package:dictionary/screens/auth/login_screen.dart';
import 'package:dictionary/screens/home/widgets/app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../data/models/user_models/user_model.dart';
import '../../data/services/user_service.dart';
import '../../main.dart';
import '../../res/themes.dart';
import '../../routes.dart';
import '../../utils.dart';
import 'widgets/user_information_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  Future<User?> checkIfUserExist() async {
    String? id = prefs.getString('userId');
    if (id == null) {
      return null;
    }
    return await UserService().getUserById(id);
  }

  @override
  Widget build(BuildContext context) {
    print(UserService.currentUserId);
    return Scaffold(
      appBar: const AppBarWidget(),
      body: FutureBuilder(
        future: checkIfUserExist(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var currentUser = snapshot.data;
            if (currentUser == null) {
              return const LoginScreen(enableSkip: false);
            } else {
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(
                          'https://i.pinimg.com/originals/12/56/00/1256000a71e6e0fbcd09c8505529889f.jpg',
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        currentUser.userName!,
                        style: AppTextStyle.bold25,
                      ),
                      Text(
                        '@username',
                        style: AppTextStyle.regular15,
                      ),
                      const SizedBox(height: 20),
                      const Divider(
                        color: AppColors.black,
                        thickness: 3,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: AppContainerStyle.border.copyWith(
                      color: AppColors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Information',
                          style: AppTextStyle.medium20,
                        ),
                        InformationWidget(
                          leading: const Icon(CupertinoIcons.envelope_open),
                          title: 'Email',
                          subtitle: '@${currentUser.email}',
                        ),
                        InformationWidget(
                          leading: const Icon(CupertinoIcons.gift),
                          title: 'Birthday',
                          subtitle: DateFormat("dd/MM/yyyy").format(
                            DateTime.parse(currentUser.dateOfBirth!),
                          ),
                        ),
                        const Divider(
                          color: AppColors.grey,
                          thickness: 2,
                          indent: 20,
                          endIndent: 20,
                        ),
                        const SizedBox(height: 20),
                        FavoriteWidget(
                          leading: const Icon(
                            CupertinoIcons.bookmark,
                            color: AppColors.darkBrown,
                          ),
                          title: 'Favorite vocabularies',
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.favoriteVocabulary,
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        FavoriteWidget(
                          leading: const Icon(
                            CupertinoIcons.square_favorites_alt,
                            color: AppColors.darkBrown,
                          ),
                          title: 'Favorite units',
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.favoriteUnit,
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        FavoriteWidget(
                          leading: const Icon(
                            CupertinoIcons.hourglass,
                            color: AppColors.darkBrown,
                          ),
                          title: 'Test history',
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.testHistory,
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        const Divider(
                          color: AppColors.grey,
                          thickness: 2,
                          indent: 20,
                          endIndent: 20,
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          onPressed: () async {
                            await showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Logout',
                                    style: AppTextStyle.bold15,
                                  ),
                                  content: Text(
                                    'Are you sure about that?',
                                    style: AppTextStyle.regular13,
                                  ),
                                  actions: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      child: const Text('Cancel'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      child: const Text('Yes'),
                                      onPressed: () async {
                                        await prefs.remove('userId');
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                          AppRoutes.login,
                                        );
                                      },
                                    ),
                                  ],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                );
                              },
                            );
                          },
                          style: AppButtonStyle.boder.copyWith(
                            backgroundColor: const MaterialStatePropertyAll(
                              AppColors.white,
                            ),
                          ),
                          icon: const Icon(
                            CupertinoIcons.square_arrow_right,
                            size: 50,
                            color: AppColors.black,
                          ),
                          label: Text(
                            'Log out',
                            style: AppTextStyle.bold15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          } else {
            return const AppLoadingIndicator();
          }
        },
      ),
    );
  }
}
