import 'package:flutter/material.dart';
import 'confirm.dart';

class IssuePage extends StatefulWidget {
  @override
  _IssuePageState createState() => _IssuePageState();
}

class _IssuePageState extends State<IssuePage> {
  TextEditingController _bookIdController = TextEditingController();
  TextEditingController _studentRollNoController = TextEditingController();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Issue Page')),
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
              title: Text('Confirm page'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/confirm');
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
              controller: _bookIdController,
              decoration: InputDecoration(labelText: 'Enter Book ID'),
            ),
            TextField(
              controller: _studentRollNoController,
              decoration: InputDecoration(labelText: 'Enter Student Roll No.'),
            ),
            SizedBox(height: 20),
            Text('Date of Issue: ${_selectedDate ?? "Select a date"}'),
            ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Text('Select Date'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      '/confirm',
                      arguments: {
                        'bookId': _bookIdController.text,
                        'rollNo': _studentRollNoController.text,
                        'date': _selectedDate.toString(),
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
}
