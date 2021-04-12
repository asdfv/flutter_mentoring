import 'package:flutter/material.dart';
import 'package:flutter_mentoring/presentation/router/route_generator.dart';

import 'presentation/first_page.dart';

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
      initialRoute: firstPageRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
