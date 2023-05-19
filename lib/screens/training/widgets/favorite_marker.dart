import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/services/user_service.dart';
import '../../../res/themes.dart';

class UnitFavoriteMarker extends StatefulWidget {
  final String userId;
  final String unitId;
  final Widget unit;
  const UnitFavoriteMarker({
    super.key,
    required this.userId,
    required this.unitId,
    required this.unit,
  });

  @override
  State<UnitFavoriteMarker> createState() => _FavoriteMarkerState();
}

class _FavoriteMarkerState extends State<UnitFavoriteMarker> {
  late IconData marker;

  @override
  void initState() {
    super.initState();
    marker = Icons.bookmark_border_sharp;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserFavoriteCollectionService().isFavoriteUnit(
        userId: UserService.currentUserId!,
        unitId: widget.unitId,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var checker = snapshot.data!;
          return Stack(
            children: [
              widget.unit,
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () async {
                    print('tapped');
                    print(checker);
                    if (checker == false) {
                      setState(() {
                        marker = Icons.bookmark_sharp;
                      });
                      await UserFavoriteCollectionService().markFavoriteUnit(
                        userId: UserService.currentUserId!,
                        unitId: widget.unitId,
                      );
                    } else {
                      setState(() {
                        marker = Icons.bookmark_border_sharp;
                      });
                      await UserFavoriteCollectionService().removeFavoriteUnit(
                        userId: UserService.currentUserId!,
                        unitId: widget.unitId,
                      );
                    }
                    print(checker);
                  },
                  child: Icon(
                    marker,
                    size: 50,
                    color: AppColors.darkRed,
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
