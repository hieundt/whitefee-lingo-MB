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
    return IconButton(
      onPressed: () {
        playAudio(widget.url);
      },
      icon: const Icon(
        CupertinoIcons.speaker_3_fill,
        size: 40,
        color: AppColors.darkGreen,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }
}
