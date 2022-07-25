import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'To Do App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool checkedValue = false;
  List<String> list = ["abc"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          ...list.map((e) => ListTile(
                leading: Checkbox(
                    value: checkedValue,
                    onChanged: (value) {
                      setState(() {
                        checkedValue = value!;
                      });
                    }),
                title: const TextField(
                  decoration: InputDecoration(),
                ),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            list.add("A");
          });
        },
        tooltip: '',
        child: const Icon(Icons.add),
      ),
    );
  }
}
