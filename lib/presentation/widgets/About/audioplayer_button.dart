import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class ButtonPlayer extends StatefulWidget {
  const ButtonPlayer({super.key});

  @override
  _ButtonPlayerState createState() => _ButtonPlayerState();
}

class _ButtonPlayerState extends State<ButtonPlayer> {
  AudioPlayer audioPlayer = AudioPlayer();

  bool isPlaying = false;
  Future<void> playAudio(String url) async {
    await audioPlayer.play(AssetSource(url));
  }

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();

    audioPlayer.setReleaseMode(ReleaseMode.loop);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:
          Icon(isPlaying ? Icons.music_note_rounded : Icons.music_off_rounded),
      onPressed: () async {
        if (isPlaying) {
          await audioPlayer.pause();
        } else {
          await playAudio('audio/BackMusic.mp3');
        }
        setState(() {
          isPlaying = !isPlaying;
        });
      },
    );
  }
}
