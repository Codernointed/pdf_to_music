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
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _filePath = '';

  Future<void> _pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF to Music'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to PDF to Music App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickPDF,
              child: const Text('Upload PDF'),
            ),
            _filePath.isNotEmpty
                ? Text('Selected PDF: $_filePath')
                : const SizedBox.shrink(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ConfigurationScreen(pdfFilePath: _filePath)),
                );
              },
              child: const Text('Configure Music'),
            ),
          ],
        ),
      ),
    );
  }
}
