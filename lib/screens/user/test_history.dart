import 'package:dictionary/data/services/user_service.dart';
import 'package:dictionary/providers/user_provider.dart';
import 'package:dictionary/screens/home/widgets/app_bar_widget.dart';
import 'package:dictionary/res/themes.dart';
import 'package:dictionary/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HistoryWidget extends StatelessWidget {
  final String? testDate;
  final String? testTopic;
  final String? testImage;
  final int? totalPoint;
  const HistoryWidget({
    super.key,
    this.testDate,
    this.totalPoint,
    this.testTopic,
    this.testImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          alignment: Alignment.topCenter,
          height: 150,
          decoration: AppContainerStyle.border.copyWith(
            color: AppColors.darkBrown,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            DateFormat("dd/MM/yyyy").format(
              DateTime.parse(testDate!),
            ),
            style: AppTextStyle.bold25.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          height: 100,
          decoration: AppContainerStyle.border.copyWith(
            color: AppColors.white,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                const Expanded(flex: 1, child: Placeholder()), // Test image
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Test topic: Photos',
                        style: AppTextStyle.medium20,
                      ),
                      Text(
                        'Total point: ${totalPoint!.toString()}',
                        style: AppTextStyle.medium20.copyWith(
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TestHistoryScreen extends StatelessWidget {
  const TestHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: const AppBarWidget(
        screenTitle: 'Test history',
        titleColor: AppColors.darkBrown,
        leading: Icon(
          CupertinoIcons.hourglass,
          color: AppColors.darkBrown,
        ),
      ),
      body: FutureBuilder(
        future: UserHistoryService()
            .getTestHistoryOfUser(userProvider.currentUser!.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var history = snapshot.data!;
            //var test = aw
            return ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: history.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20);
              },
              itemBuilder: (context, index) {
                return HistoryWidget(
                  testDate: history[index].testDate,
                  // testTopic: ,
                  // testImage: ,
                  totalPoint: history[index].totalPoint,
                );
              },
            );
          } else {
            return const AppLoadingIndicator();
          }
        },
      ),
    );
  }
}
