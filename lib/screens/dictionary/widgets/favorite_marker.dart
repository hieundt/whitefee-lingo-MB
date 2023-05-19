import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../data/services/user_service.dart';
import '../../../providers/user_provider.dart';
import '../../../res/themes.dart';

class FavoriteMarker extends StatefulWidget {
  final String userId;
  final String vocabularyId;
  const FavoriteMarker({
    super.key,
    required this.userId,
    required this.vocabularyId,
  });

  @override
  State<FavoriteMarker> createState() => _FavoriteMarkerState();
}

class _FavoriteMarkerState extends State<FavoriteMarker> {
  //Mocking
  //var checkerMock = false;
  late IconData marker;

  @override
  void initState() {
    super.initState();
    marker = CupertinoIcons.bookmark;
  }

  @override
  Widget build(BuildContext context) {
    //var marker = CupertinoIcons.bookmark;
    return FutureBuilder(
      future: UserFavoriteCollectionService().isFavoriteVocabulary(
        userId: UserService.currentUserId!,
        vocabularyId: widget.vocabularyId,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var checker = snapshot.data!;
          return GestureDetector(
            onTap: () async {
              // print(checkerMock);
              // if (checkerMock == false) {
              //   setState(() {
              //     checkerMock = true;
              //     marker = CupertinoIcons.bookmark_solid;
              //   });
              // } else {
              //   setState(() {
              //     checkerMock = false;
              //     marker = CupertinoIcons.bookmark;
              //   });
              // }
              print(checker);
              if (checker == false) {
                setState(() {
                  marker = CupertinoIcons.bookmark_fill;
                });
                await UserFavoriteCollectionService().markFavoriteVocabulary(
                  userId: UserService.currentUserId!,
                  vocabularyId: widget.vocabularyId,
                );
              } else {
                setState(() {
                  marker = CupertinoIcons.bookmark;
                });
              }
              print(checker);
            },
            child: Icon(
              marker,
              size: 50,
              color: AppColors.darkBrown,
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
