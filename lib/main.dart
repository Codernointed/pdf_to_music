import 'package:flutter/material.dart';
import 'ConfigurationScreen.dart';
import 'PreviewScreen.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(const PdfToMusicApp());
}

class PdfToMusicApp extends StatelessWidget {
  const PdfToMusicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDF to Music',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
