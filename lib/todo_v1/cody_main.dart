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
      home: const MyHomePage(title: 'My To do App'),
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
  bool check = false;
  List<String> list = [];

  void _addThing() {
    setState(() {
      list.add('');
      //print(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
      
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ...list.map((e) {
                return const TF();
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addThing,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TF extends StatefulWidget {
  const TF({Key? key}) : super(key: key);

  @override
  State<TF> createState() => _TFState();
}

class _TFState extends State<TF> {
  bool check = false;

  void _checkBox() {
    setState(() {
      check = !check;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (check == true) {
      return TextField(
        decoration: InputDecoration(
            icon: IconButton(
          onPressed: _checkBox,
          icon: const Icon(
            Icons.check_box,
            color: Colors.blue,),
        )),
      );
    }
    if (check == false) {
      return TextField(
        decoration: InputDecoration(
            icon: IconButton(
          onPressed: _checkBox,
          icon: const Icon(
            Icons.check_box_outline_blank,
            color: Colors.blue,
          ),
        )),
      );
    }
    return Container();
  }
}
