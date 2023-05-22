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
  IconData? marker;
  Color? color;
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
    if (checker == true) {
      color = AppColors.darkRed;
      marker = CupertinoIcons.heart_fill;
    } else {
      color = AppColors.black;
      marker = CupertinoIcons.heart;
    }
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
                  color = AppColors.darkRed;
                  marker = CupertinoIcons.heart_fill;
                });
                await UserFavoriteCollectionService().markFavoriteUnit(
                  userId: UserService.currentUserId!,
                  unitId: widget.unitId,
                );
              } else {
                setState(() {
                  color = AppColors.black;
                  marker = CupertinoIcons.heart;
                });
                await UserFavoriteCollectionService().removeFavoriteUnit(
                  userId: UserService.currentUserId!,
                  unitId: widget.unitId,
                );
              }
            },
            child: SizedBox.fromSize(
              size: const Size(50, 50),
              child: Icon(
                marker,
                size: 30,
                color: color,
              ),
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
