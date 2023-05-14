import 'package:dictionary/res/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../routes.dart';
import 'widgets/user_information_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 70.0,
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/originals/12/56/00/1256000a71e6e0fbcd09c8505529889f.jpg'),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(height: 10),
            Text(
              '@hippo',
              style: AppTextStyle.regular15.copyWith(
                color: AppColors.darkGray,
              ),
            ),
            Text(
              'Fred Phoenix',
              style: AppTextStyle.medium25,
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
              const InformationWidget(
                leading: Icon(CupertinoIcons.envelope_open),
                title: 'Email',
                subtitle: 'mocking@email.com',
              ),
              const InformationWidget(
                leading: Icon(CupertinoIcons.gift),
                title: 'Birthday',
                subtitle: '03/08/2001',
              ),
              const Divider(
                color: AppColors.gray,
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
                color: AppColors.gray,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {},
                style: AppButtonStyle.boder,
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
}
