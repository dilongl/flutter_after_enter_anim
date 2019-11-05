# Flutter After Enter Anim

[![pub package](https://img.shields.io/pub/v/after_enter_anim.svg)](https://pub.dartlang.org/packages/after_enter_anim)

Brings functionality to execute code after the enter animation finish.


## Quick Usage

Add `with AfterEnterAnimMixin<MyWidget>` mixin to your `State<MyWidget>` class and then implement the `void afterEnterAnim(BuildContext context)` abstract method. Code in this method will be called the enter animation finish.


## Usage

This demo showcases how this package resolves the shortcomings shown above:

```dart
import 'package:after_enter_anim/after_enter_anim.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'After Enter Anim Example',
      home: new FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => SecondScreen())),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  @override
  SecondScreenState createState() => new SecondScreenState();
}

class SecondScreenState extends State<SecondScreen>
    with AfterEnterAnimMixin<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: new Container(color: Colors.red));
  }

  @override
  void afterEnterAnim(BuildContext context) {
    showHelloWorld();
  }

  void showHelloWorld() {
    showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        content: new Text('Hello World'),
        actions: <Widget>[
          new FlatButton(
            child: new Text('DISMISS'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }
}

```