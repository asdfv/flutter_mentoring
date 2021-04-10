import 'package:flutter/material.dart';

import 'presentation/first_page.dart';
import 'presentation/second_page.dart';

void main() {
  runApp(MyApp());
}

/// App that can navigate and go back with the result.
/// Also dialog is used to prevent accidentally exit.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Module 4',
      initialRoute: FirstPage.route,
      routes: {
        FirstPage.route: (_) => FirstPage(),
        SecondPage.route: (_) => SecondPage(),
      },
    );
  }
}
