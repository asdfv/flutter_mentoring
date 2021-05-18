import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mentoring/data/todo_store.dart';

import 'settings_page.dart';
import 'utils/extensions.dart';

class TodoPage extends StatefulWidget {
  TodoPage({required this.store});

  static final String route = "/todo";
  final TodoStore store;

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  String headerText = "";

  @override
  Widget build(BuildContext context) {
    final todos = widget.store.getAll();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.getLocalizedString('todo_title'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, SettingsPage.route);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.store.add("Custom todo");
          setState(() {});
        },
        tooltip: 'Add custom todo',
        child: Icon(Icons.add),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(shape: BoxShape.rectangle, color: Colors.cyan),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(context.getLocalizedString("todo_select_item_label")),
                Center(child: Text(headerText)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final todo = todos[index];
                return _createTodoItem(todo);
              },
              itemCount: todos.length,
            ),
          )
        ],
      ),
    );
  }

  Widget _createTodoItem(String todo) {
    return ListTile(
      title: Text(context.getLocalizedString("todo_note_label")),
      subtitle: Text(todo),
      leading: Icon(Icons.work),
      onTap: () {
        setState(() {
          headerText = todo;
        });
      },
    );
  }
}
