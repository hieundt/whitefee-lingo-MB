import 'package:flutter/cupertino.dart';
import '../../../data/services/user_service.dart';
import '../../../res/themes.dart';

class UnitFavoriteMarker extends StatefulWidget {
  final String userId;
  final String unitId;
  const UnitFavoriteMarker({
    super.key,
    required this.userId,
    required this.unitId,
  });

  @override
  State<UnitFavoriteMarker> createState() => _UnitFavoriteMarkerState();
}

class _UnitFavoriteMarkerState extends State<UnitFavoriteMarker> {
  late IconData marker;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initMarker();
    });
  }

  Future<void> initMarker() async {
    bool checker = await UserFavoriteCollectionService().isFavoriteUnit(
      userId: UserService.currentUserId!,
      unitId: widget.unitId,
    );
    marker = checker ? CupertinoIcons.bookmark_fill : CupertinoIcons.bookmark;
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

          return GestureDetector(
            onTap: () async {
              if (checker == false) {
                setState(() {
                  marker = CupertinoIcons.bookmark_fill;
                });
                await UserFavoriteCollectionService().markFavoriteUnit(
                  userId: UserService.currentUserId!,
                  unitId: widget.unitId,
                );
              } else {
                setState(() {
                  marker = CupertinoIcons.bookmark;
                });
                await UserFavoriteCollectionService().removeFavoriteUnit(
                  userId: UserService.currentUserId!,
                  unitId: widget.unitId,
                );
              }
            },
            child: Icon(
              marker,
              size: 40,
              color: AppColors.darkBrown,
            ),
          );
        } else {
          return SizedBox.fromSize(
            size: const Size(40, 40),
          );
        }
      },
    );
  }
}
