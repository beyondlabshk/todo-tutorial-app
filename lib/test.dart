import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Phone {
  double weight;
  double width;
  String model;

  Phone(
    this.weight,
    this.width,
    this.model,
  );
}

final phone = Phone(
  4.5,
  140,
  'iPhone 13 Pro',
);

void main() {
  int myHeight = 190;
  // myHeight = null;

  String myName = 'Sam';
  // myName = null;

  myName = 'test';
}

class Test extends StatefulWidget {
  const Test({
    Key? key,
  }) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}