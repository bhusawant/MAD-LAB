import 'package:flutter/material.dart';
import 'issue.dart';

class BookPage extends StatefulWidget {
  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  TextEditingController _bookNameController = TextEditingController();
  TextEditingController _publisherNameController = TextEditingController();
  String? _selectedBranch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Page')),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            ListTile(
              title: Text('Issue Book'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/issue');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _bookNameController,
              decoration: InputDecoration(labelText: 'Enter Book Name'),
            ),
            TextField(
              controller: _publisherNameController,
              decoration: InputDecoration(labelText: 'Enter Publisher Name'),
            ),
            DropdownButtonFormField<String>(
              value: _selectedBranch,
              onChanged: (value) {
                setState(() {
                  _selectedBranch = value;
                });
              },
              items: ['Branch A', 'Branch B', 'Branch C']
                  .map((branch) => DropdownMenuItem(
                        value: branch,
                        child: Text(branch),
                      ))
                  .toList(),
              hint: Text('Select Branch'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _bookNameController.clear();
                      _publisherNameController.clear();
                      _selectedBranch = null;
                    });
                  },
                  child: Text('Clear'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      '/issue',
                      arguments: {
                        'bookName': _bookNameController.text,
                        'publisherName': _publisherNameController.text,
                        'branch': _selectedBranch,
                      },
                    );
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
