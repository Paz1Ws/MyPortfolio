import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class ButtonPlayer extends StatefulWidget {
  final String audioUrl; // Provide the audio URL in the constructor

  const ButtonPlayer({super.key, required this.audioUrl});

  @override
  _ButtonPlayerState createState() => _ButtonPlayerState();
}

class _ButtonPlayerState extends State<ButtonPlayer> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer.setReleaseMode(ReleaseMode.loop); // Set loop mode once

    // Pre-load audio for potentially faster playback (optional)
    _audioPlayer.audioCache.load(widget.audioUrl);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void togglePlayback() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource(widget.audioUrl));
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:
          Icon(_isPlaying ? Icons.music_note_rounded : Icons.music_off_rounded),
      onPressed: togglePlayback, // Use the togglePlayback method
    );
  }
}
