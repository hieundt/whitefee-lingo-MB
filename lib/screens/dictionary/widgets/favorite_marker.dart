import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context).currentUser;
    var marker = CupertinoIcons.bookmark;
    return FutureBuilder(
      future: UserFavoriteCollectionService().isFavoriteVocabulary(
        userId: userProvider!.id!,
        vocabularyId: widget.vocabularyId,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var checker = snapshot.data!;
          return GestureDetector(
            onTap: () async {
              print(checker);
              if (checker == false) {
                setState(() {
                  marker = CupertinoIcons.bookmark_fill;
                });
                await UserFavoriteCollectionService().markFavoriteVocabulary(
                  userId: userProvider.id!,
                  vocabularyId: widget.vocabularyId,
                );
              } else {
                setState(() {
                  marker = CupertinoIcons.bookmark;
                });
              }
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
