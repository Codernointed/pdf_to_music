import 'package:flutter/material.dart';
import 'PreviewScreen.dart';

class ConfigurationScreen extends StatefulWidget {
  final String pdfFilePath;
  ConfigurationScreen({required this.pdfFilePath});

  @override
  _ConfigurationScreenState createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  double _tempo = 120;
  String _selectedInstrument = 'Piano';
  Map<String, String> _keywordMapping = {};

  final List<String> _instruments = ['Piano', 'Guitar', 'Flute', 'Drums'];

  void _editKeywordMapping() async {
    String newKeyword = '';
    String newMusicalElement = '';

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Keyword Mapping'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Keyword'),
                onChanged: (value) {
                  newKeyword = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Musical Element'),
                onChanged: (value) {
                  newMusicalElement = value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (newKeyword.isNotEmpty && newMusicalElement.isNotEmpty) {
                  setState(() {
                    _keywordMapping[newKeyword] = newMusicalElement;
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Configure Music Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Tempo:',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: _tempo,
              min: 60,
              max: 240,
              onChanged: (value) {
                setState(() {
                  _tempo = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Instrument:',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<String>(
              value: _selectedInstrument,
              onChanged: (value) {
                setState(() {
                  _selectedInstrument = value!;
                });
              },
              items: _instruments.map((instrument) {
                return DropdownMenuItem<String>(
                  value: instrument,
                  child: Text(instrument),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Keywords Mapping:',
              style: TextStyle(fontSize: 18),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _keywordMapping.length,
                itemBuilder: (context, index) {
                  final keyword = _keywordMapping.keys.elementAt(index);
                  final musicalElement = _keywordMapping[keyword];
                  return ListTile(
                    title: Text(keyword),
                    subtitle: Text(musicalElement ?? ''),
                    onTap: () {
                      _editKeywordMapping();
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PreviewScreen(pdfFilePath: widget.pdfFilePath),
                  ),
                );
              },
              child: const Text('Preview Music'),
            ),
          ],
        ),
      ),
    );
  }
}
