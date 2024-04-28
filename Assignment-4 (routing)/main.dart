import 'package:flutter/material.dart';
import 'book.dart';
import 'issue.dart';
import 'confirm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Issue App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Defining routes for navigation
      initialRoute: '/',
      routes: {
        '/': (context) => BookPage(),
        '/issue': (context) => IssuePage(),
        '/confirm': (context) => ConfirmPage(),
      },
    );
  }
}
