import 'package:flutter/material.dart';
import 'issue.dart';

class ConfirmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(title: Text('Confirm Page')),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Book Name: ${data?['bookName'] ?? ''}'),
            Text('Publisher Name: ${data?['publisherName'] ?? ''}'),
            Text('Branch: ${data?['branch'] ?? ''}'),
            Text('Book ID: ${data?['bookId'] ?? ''}'),
            Text('Student Roll No.: ${data?['rollNo'] ?? ''}'),
            Text('Date of Issue: ${data?['date'] ?? ''}'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/issue');
                  },
                  child: Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (data != null) {
                      print('Data Submitted: $data');
                    } else {
                      print('No data available.');
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
