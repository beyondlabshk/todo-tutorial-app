import 'package:flutter/material.dart';

class Todo {
  bool isComplete;
  String name;
  Todo({
    this.name = '',
    this.isComplete = false,
  });
}

class TodoPage extends StatefulWidget {
  const TodoPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My To do App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: _buildTodos(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            todos.add(Todo());
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _buildTodos() {
    List<Widget> todoWidgets = [];
    todos.asMap().forEach(
      (index, element) {
        todoWidgets.add(
          ListTile(
            title: TextFormField(
              initialValue: element.name,
              onChanged: (val) {
                todos[index].name = val;
              },
            ),
            leading: Checkbox(
              value: element.isComplete,
              onChanged: (val) {
                setState(() {
                  todos[index].isComplete = !element.isComplete;
                });
              },
            ),
          ),
        );
      },
    );
    return todoWidgets;
  }
}
