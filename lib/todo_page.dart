import 'package:flutter/material.dart';

class Todo {
  bool isComplete;
  String name;
  Todo({
    this.isComplete = false,
    this.name = '',
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
          children: [
            for (int index = 0; index < todos.length; index++)
              TodoItem(
                name: todos[index].name,
                isChecked: todos[index].isComplete,
                onNameChanged: (val) {
                  todos[index].name = val;
                },
                onCheckChanged: (val) {
                  setState(() {
                    todos[index].isComplete = val;
                  });
                },
              ),
          ],
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
}

class TodoItem extends StatelessWidget {
  final String name;
  final bool isChecked;
  final Function(bool) onCheckChanged;
  final Function(String) onNameChanged;
  const TodoItem({
    Key? key,
    required this.name,
    required this.isChecked,
    required this.onNameChanged,
    required this.onCheckChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        initialValue: name,
        onChanged: (val) {
          onNameChanged(val);
        },
      ),
      leading: Checkbox(
        value: isChecked,
        onChanged: (val) {
          onCheckChanged(val!);
        },
      ),
    );
  }
}
