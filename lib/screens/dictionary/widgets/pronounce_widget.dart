import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../res/themes.dart';

class PronounceWidget extends StatefulWidget {
  final String url;
  const PronounceWidget({
    super.key,
    required this.url,
  });

  @override
  State<PronounceWidget> createState() => _PronounceWidgetState();
}

class _PronounceWidgetState extends State<PronounceWidget> {
  AudioPlayer audioPlayer = AudioPlayer();

  void playAudio(String url) async {
    await audioPlayer.play(UrlSource(url));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Material(
        color: AppColors.transparent,
        child: InkWell(
          onTap: () {
            playAudio(widget.url);
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'US',
                  style: AppTextStyle.medium13,
                ),
              ),
              const SizedBox(width: 5),
              const Icon(
                CupertinoIcons.speaker_3_fill,
                size: 25,
                color: AppColors.darkGreen,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }
}

//  return SizedBox.fromSize(
//       size: const Size(50, 50),
//       child: ClipOval(
//         child: Material(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(60),
//           ),
//           color: AppColors.transparent,
//           child: InkWell(
//             borderRadius: BorderRadius.circular(30),
//             onTap: () {
//               playAudio(widget.url);
//             },
//             child: Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10),
//                   child: Text(
//                     'us',
//                     style: AppTextStyle.medium13,
//                   ),
//                 ),
//                 const Icon(
//                   CupertinoIcons.speaker_3_fill,
//                   size: 25,
//                   color: AppColors.darkGreen,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );