class TodoStore {
  final List<String> _todos = List.generate(3, (index) => 'Item number $index');

  List<String> getAll() {
    return _todos;
  }

  void add(String todo) {
    _todos.add(todo);
  }
}
