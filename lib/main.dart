import 'package:flutter/material.dart';
import 'package:vasili_mentoring_tasks/data/todo_store.dart';

import 'presentation/todo_page.dart';

void main() {
  runApp(MyApp());
}

/// App with the list of items and possibility to show tapped item in header.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoStore store = TodoStore();
    return MaterialApp(
      title: 'Module 3 - Basics',
      home: TodoList(store: store,),
    );
  }
}
