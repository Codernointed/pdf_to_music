import 'package:flutter/material.dart';

class PreviewScreen extends StatefulWidget {
  final String pdfFilePath; // Pass the PDF file path from the previous screen

  PreviewScreen({required this.pdfFilePath});

  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  bool _isMusicGenerated = false;
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
                ? AudioPlayerWidget() // Add your audio player widget here
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

class AudioPlayerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement your audio player widget here
    // You can use a third-party package like audioplayers for audio playback
    return Container(
        // Your audio player UI goes here
        );
  }
}
