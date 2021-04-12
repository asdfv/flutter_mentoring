import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vasili_mentoring_tasks/data/todo_store.dart';

class TodoList extends StatefulWidget {
  final TodoStore store;

  TodoList({this.store});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  String headerText = "Header";

  @override
  Widget build(BuildContext context) {
    final todos = widget.store.getAll();
    return Scaffold(
      appBar: AppBar(title: Text("Todo list")),
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
