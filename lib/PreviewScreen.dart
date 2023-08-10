import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class PreviewScreen extends StatefulWidget {
  final String pdfFilePath; // Pass the PDF file path from the previous screen

  PreviewScreen({required this.pdfFilePath});

  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  bool _isMusicGenerated = false;
  String _audioFilePath =
      'path_to_your_audio_file.mp3'; // Replace with your audio file path
  // Add more variables as needed for your music generation and playback

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview Music'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Preview Generated Music',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _isMusicGenerated
                ? AudioPlayerWidget(
                    audioFilePath: _audioFilePath) // Add audio player widget
                : Text('Music has not been generated yet.'),
            SizedBox(height: 20),
            // Add sliders for adjustment controls if needed
            // Add the regenerate button
            ElevatedButton(
              onPressed: () {
                // Add logic to regenerate music
              },
              child: Text('Regenerate Music'),
            ),
          ],
        ),
      ),
    );
  }
}

class AudioPlayerWidget extends StatefulWidget {
  final String audioFilePath; // Path to the audio file you want to play

  AudioPlayerWidget({required this.audioFilePath});

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.onPlayerStateChanged.listen((PlayerState event) {
      if (event == PlayerState.completed || event == PlayerState.stopped) {
        setState(() {
          _isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.resume();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ElevatedButton(
          onPressed: _playPause,
          child: Text(_isPlaying ? 'Pause' : 'Play'),
        ),
      ],
    );
  }
}
