import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../../../res/themes.dart';

class QuestionAudioWidget extends StatefulWidget {
  const QuestionAudioWidget({
    super.key,
    required this.url,
  });

  final String url;

  @override
  State<QuestionAudioWidget> createState() => _QuestionAudioWidgetState();
}

class _QuestionAudioWidgetState extends State<QuestionAudioWidget> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  StreamSubscription<PlayerState>? playerStateSubscription;
  StreamSubscription<Duration>? durationSubscription;
  StreamSubscription<Duration>? positionSubscription;

  @override
  void initState() {
    super.initState();
    setAudio();

    playerStateSubscription = audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    durationSubscription = audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    positionSubscription = audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds';
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    audioPlayer.setSourceUrl(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      //height: 70,
      decoration: AppContainerStyle.border.copyWith(
        color: AppColors.white,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.darkGreen,
              child: IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: AppColors.yellow,
                ),
                iconSize: 20,
                onPressed: () async {
                  if (isPlaying) {
                    await audioPlayer.pause();
                  } else {
                    String url = widget.url;
                    await audioPlayer.play(UrlSource(url));
                  }
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatTime(position.inSeconds),
                  style: AppTextStyle.bold12,
                ),
                const Text('/'),
                Text(
                  formatTime(duration.inSeconds),
                  style: AppTextStyle.bold12,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Slider(
              inactiveColor: AppColors.grey,
              activeColor: AppColors.black,
              thumbColor: AppColors.black,
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) {
                final position = Duration(seconds: value.toInt());
                audioPlayer.seek(position);
                audioPlayer.resume();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    playerStateSubscription?.cancel();
    durationSubscription?.cancel();
    positionSubscription?.cancel();
    audioPlayer.dispose();
    super.dispose();
  }
}
