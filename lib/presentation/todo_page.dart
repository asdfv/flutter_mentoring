import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vasili_mentoring_tasks/data/todo_store.dart';
import 'package:vasili_mentoring_tasks/presentation/settings_page.dart';

import 'localization/app_localization.dart';

class TodoPage extends StatefulWidget {
  static final String route = "/todo";
  final TodoStore store;

  TodoPage({this.store});

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
          AppLocalizations.of(context).translate('todo_title'),
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
                Text("Selected item: "),
                Center(child: Text(headerText)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                var todo = todos[index];
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
      title: Text("Note"),
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
