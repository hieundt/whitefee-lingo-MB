import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../data/services/training_service.dart';
import '../../data/services/user_service.dart';
import '../../providers/user_provider.dart';
import '../../res/themes.dart';
import '../../utils.dart';
import '../home/widgets/app_bar_widget.dart';

class HistoryWidget extends StatelessWidget {
  final String? testId;
  final String? testDate;
  final int? totalPoint;
  const HistoryWidget({
    super.key,
    this.testId,
    this.testDate,
    this.totalPoint,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TestService().getTestById(testId!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var test = snapshot.data!;
          return Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: 135,
                decoration: AppContainerStyle.border.copyWith(
                  color: AppColors.darkBrown,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'Test date: ${DateFormat("dd/MM/yyyy").format(
                    DateTime.parse(testDate!),
                  )}',
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
                      Expanded(
                        flex: 1,
                        child: Image.network(test.image!),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              test.name!,
                              style: AppTextStyle.medium20,
                            ),
                            Text(
                              'Total point: ${totalPoint!.toString()}',
                              style: AppTextStyle.medium20.copyWith(
                                color: totalPoint! > 1500
                                    ? AppColors.green
                                    : AppColors.red,
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
        } else {
          return const SizedBox.shrink();
        }
      },
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
            .getTestHistoryOfUser(userProvider.currentUserId!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var history = snapshot.data!;
            return ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: history.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20);
              },
              itemBuilder: (context, index) {
                return HistoryWidget(
                  testDate: history[index].testDate,
                  totalPoint: history[index].totalPoint,
                  testId: history[index].testId,
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
