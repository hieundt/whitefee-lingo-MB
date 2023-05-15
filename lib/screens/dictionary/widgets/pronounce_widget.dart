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
    return SizedBox.fromSize(
      size: const Size(85, 85),
      child: ClipOval(
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          color: AppColors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              playAudio(widget.url);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.speaker_3_fill,
                  size: 40,
                  color: AppColors.darkGreen,
                ),
                Text(
                  "Phonetics",
                  style: AppTextStyle.bold12,
                ),
              ],
            ),
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
